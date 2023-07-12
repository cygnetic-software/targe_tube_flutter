import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:aneen/model/video_model.dart';
import 'package:aneen/global/user.dart';

class DashboardController extends GetxController {
  // Create a list to hold videos
  var videos = <VideoModel>[].obs;

  // Create a boolean to indicate whether data is loading
  var loading = true.obs;

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

    loading.value = false;
  }
}
