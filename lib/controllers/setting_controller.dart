import 'package:aneen/global/user.dart';
import 'package:aneen/model/user_model.dart';
import 'package:aneen/model/video_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  final blockedUserIds = [].obs;
  final usernameController = TextEditingController();
  final loadingVideos = true.obs;
  final loadingPendingVideos = true.obs;

  @override
  void onInit() {
    super.onInit();
    print("*******************************s");
    print(user.value.username);
    blockedUserIds.value = user.value.blockedUsers;
    usernameController.text = user.value.username;
  }

  Future<List<VideoModel>> getVideos() async {
    loadingVideos.value = true;
    final querySnapshot = await FirebaseFirestore.instance
        .collection('posts')
        .where('isPending', isEqualTo: false)
        .where('uploader_id', isEqualTo: user.value.id)
        .get();
    print("=============================================");
    print(querySnapshot.docs);
    final videos = querySnapshot.docs.map((doc) {
      print(doc.data());
      return VideoModel.fromJson(doc.data());
    }).toList();
    loadingVideos.value = false;
    return videos;
  }

  Future<List> getPendingVideos() async {
    loadingPendingVideos.value = true;
    final querySnapshot = await FirebaseFirestore.instance
        .collection('posts')
        .where('isPending', isEqualTo: true)
        .where('uploader_id', isEqualTo: user.value.id)
        .get();

    final videos = querySnapshot.docs.map((doc) => doc.data()).toList();
    loadingPendingVideos.value = false;
    return videos;
  }

  Future<List<User>> getBlockedUsers() async {
    final blockedUsers = <User>[];

    for (final userId in blockedUserIds) {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      final user = querySnapshot.data();
      blockedUsers.add(User(
          id: querySnapshot.id,
          username: querySnapshot.data()!["name"],
          email: querySnapshot.data()!["email"]));
    }

    return blockedUsers;
  }

  Future<void> deleteVideo(postId) async {
    // Delete post from the posts collection
    await FirebaseFirestore.instance.collection('posts').doc(postId).delete();

    // Delete post from storage (replace 'video_path' with your actual storage path)
    final storageRef = FirebaseStorage.instance.ref().child('video_path');
    await storageRef.delete();
  }

  Future<void> saveSetting() async {
    final newName = usernameController.text.trim();

    if (newName.length > 3 && newName.isNotEmpty) {
      // Update the name in the user object
      user.value.username = newName;

      // Update the name in Firebase Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.value.id)
          .update({'username': newName});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<SettingController>();
  }
}
