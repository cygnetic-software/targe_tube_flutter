import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aneen/model/video_model.dart';
import 'package:aneen/global/user.dart';

class DashboardController extends GetxController {
  // Create a list to hold videos
  var filteredVideos = <VideoModel>[].obs;

  var videos = <VideoModel>[].obs;

  // Create a boolean to indicate whether data is loading
  var loading = true.obs;

  final searchEditingController = TextEditingController();

  final searchFocusNode = FocusNode();
  // Initialize FirebaseFirestore instance
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    loading.value = true;

    QuerySnapshot querySnapshot = await _firestore.collection('posts').get();

    List<QueryDocumentSnapshot> data = querySnapshot.docs;

    List<VideoModel> videosFromData = data
        .map((e) {
          var data = e.data();
          if (data != null) {
            return VideoModel.fromJson(data as Map<String, dynamic>);
          } else {
            return null;
          }
        })
        .toList()
        .whereType<VideoModel>()
        .toList();

    videosFromData = videosFromData
        .where(
            (element) => !user.value.blockedUsers.contains(element.uploaderId))
        .toList();

    videos.value = videosFromData;
    filteredVideos.value = videos;

    loading.value = false;
  }

  void searchVideos(String query) {
    if (query.isEmpty) {
      filteredVideos.value = videos; // Show all videos when query is empty
    } else {
      // Filter videos based on query
      filteredVideos.value = videos.where((video) {
        final lowerCaseQuery = query.toLowerCase();
        final title = video.title.toLowerCase();
        final category = video.category.toLowerCase();
        final subcategory = video.subcategory.toLowerCase();

        return title.contains(lowerCaseQuery) ||
            category.contains(lowerCaseQuery) ||
            subcategory.contains(lowerCaseQuery);
      }).toList();
    }
    searchFocusNode.unfocus();
  }
}
