import 'package:aneen/global/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  final uid = "".obs;
  final name = "".obs;
  final email = "".obs;
  final blockedUserIds = [].obs;
  final usernameController = TextEditingController();
  final loadingVideos = true.obs;
  final loadingPendingVideos = true.obs;

  @override
  void onInit() {
    super.onInit();
    print("*******************************s");
    print(user.value.username);
    uid.value = user.value.id;
    name.value = user.value.username;
    email.value = user.value.email;
    blockedUserIds.value = user.value.blockedUsers;
    usernameController.text = name.value;
  }

  Future<List> getVideos() async {
    loadingVideos.value = true;
    final querySnapshot = await FirebaseFirestore.instance
        .collection('posts')
        .where('isPending', isEqualTo: false)
        .where('uploader_id', isEqualTo: uid)
        .get();

    final videos = querySnapshot.docs.map((doc) => doc.data()).toList();
    loadingVideos.value = false;
    return videos;
  }

  Future<List> getPendingVideos() async {
    loadingPendingVideos.value = true;
    final querySnapshot = await FirebaseFirestore.instance
        .collection('posts')
        .where('isPending', isEqualTo: true)
        .where('uploader_id', isEqualTo: uid)
        .get();

    final videos = querySnapshot.docs.map((doc) => doc.data()).toList();
    loadingPendingVideos.value = false;
    return videos;
  }

  Future<List> getBlockedUsers() async {
    final blockedUsers = <dynamic>[];

    for (final userId in blockedUserIds) {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('id', isEqualTo: userId)
          .get();

      final user = querySnapshot.docs.map((doc) => doc.data()).first;
      blockedUsers.add(user);
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
          .doc(uid.value)
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
