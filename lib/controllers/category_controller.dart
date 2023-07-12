import 'package:aneen/global/categories.dart';
import 'package:aneen/global/user.dart';
import 'package:aneen/model/category_model.dart';
import 'package:aneen/model/video_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final loadingCategories = false.obs;
  final selectedCategory = "".obs;
  final selectedSubcategory = "".obs;
  void fetchCategories() async {
    loadingCategories.value = true;
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('categories').get();
      final List<Category> allCategories = querySnapshot.docs
          .map((doc) => Category.fromJson(doc.data()))
          .toList();

      categories.value = allCategories;
      loadingCategories.value = false;
      print('Categories fetched: $categories');
    } catch (e) {
      loadingCategories.value = false;
      print('Failed to fetch categories: $e');
    }
  }

  Future<List<VideoModel>> searchByCategory(String category) async {
    try {
      final QuerySnapshot querySnapshot = await _firestore
          .collection('posts')
          .where('category', isEqualTo: category)
          .get();

      final List<Map<String, dynamic>> posts = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      // Filter posts to exclude blocked users' posts
      final List<Map<String, dynamic>> filteredPosts = posts
          .where((post) => !blockedUserIds.contains(post['uploader_id']))
          .toList();

      final List<VideoModel> filteredVideos =
          filteredPosts.map((e) => VideoModel.fromJson(e)).toList();

      return filteredVideos;
    } catch (e) {
      print('Failed to search posts by category: $e');
      return [];
    }
  }

  Future<List<VideoModel>> searchByCategorySubcategory(
      String category, String subcategory) async {
    try {
      final QuerySnapshot querySnapshot = await _firestore
          .collection('posts')
          .where('category', isEqualTo: category)
          .where('subcategory', isEqualTo: subcategory)
          .get();

      final List<Map<String, dynamic>> posts = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      // Filter posts to exclude blocked users' posts
      final List<Map<String, dynamic>> filteredPosts = posts
          .where((post) => !blockedUserIds.contains(post['uploader_id']))
          .toList();
      final List<VideoModel> filteredVideos =
          filteredPosts.map((e) => VideoModel.fromJson(e)).toList();

      return filteredVideos;
    } catch (e) {
      print('Failed to search posts by category and subcategory: $e');
      return [];
    }
  }

  List get blockedUserIds {
    return user.value.blockedUsers;
  }
}
