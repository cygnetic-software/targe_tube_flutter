import 'dart:io';
import 'package:aneen/utils/custom_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_video_info/flutter_video_info.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoController extends GetxController {
  final titleController = TextEditingController();
  final categoryController = "".obs;
  final subcategoryController = "".obs;
  final picker = ImagePicker();
  final videoLink = "".obs;
  final thumbnailLink = "".obs;
  final uploadLoading = false.obs;
  final saveLoading = false.obs;
  final uploadProgress = 0.0.obs;

  final subcategoryValue = "".obs;
  final videoInfo = FlutterVideoInfo();

  Future<List<String>> startRecording() async {
    final pickedFile = await picker.pickVideo(
        source: ImageSource.camera, maxDuration: Duration(minutes: 3));
    return uploadVideo(pickedFile);
  }

  Future<List<String>> uploadVideo(XFile? pickedFile) async {
    if (pickedFile == null) {
      customGetAlert("Error", "No File Selected", CustomAlertType.error);
      return ['', ''];
    }

    File videoFile = File(pickedFile.path);

    // Get video duration

    final videoData = await videoInfo.getVideoInfo(videoFile.path);

    final duration = videoData!.duration;
    if (duration! > 3 * 60 * 1000) {
      // Video is longer than 3 minutes, show an error message to the user
      customGetAlert(
          "Error", "Video must be less then 3 minutes", CustomAlertType.error);
      return ['', ''];
    }

    FirebaseStorage storage = FirebaseStorage.instance;

    try {
      uploadLoading.value = true;
      uploadProgress.value = 0.0; // Reset progress before starting the upload
      String fileName = videoFile.uri.pathSegments.last;

      final task = storage.ref('videos/$fileName').putFile(
            videoFile,
            // Set the metadata to enable the progress updates
            SettableMetadata(contentType: 'video/mp4'),
          );

      task.snapshotEvents.listen((TaskSnapshot snapshot) {
        uploadLoading.value = false;
        uploadProgress.value = snapshot.bytesTransferred.toDouble() /
            snapshot.totalBytes.toDouble();
      });

      await task; // Wait for the upload task to complete

      String? thumbnailPath = await VideoThumbnail.thumbnailFile(
        video: pickedFile.path,
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.PNG,
        maxHeight: 400,
      );

      String thumbnailFileName =
          'thumbnails/' + videoFile.uri.pathSegments.last + '.png';

      final thumbnailTask = storage
          .ref(thumbnailFileName)
          .putFile(File(thumbnailPath.toString()));

      await thumbnailTask; // Wait for the thumbnail upload task to complete

      var downloadUrl = await storage.ref('videos/$fileName').getDownloadURL();
      var thumbnailUrl = await storage
          .ref(thumbnailFileName)
          .getDownloadURL(); // Get the download URL of the thumbnail

      uploadProgress.value =
          0.0; // Reset progress after the upload is completed
      return [downloadUrl, thumbnailUrl];
    } on FirebaseException catch (e) {
      uploadLoading.value = false;
      customGetAlert("Error", e.message.toString(), CustomAlertType.error);
      return ['', ''];
    } catch (e) {
      customGetAlert("Error", e.toString(), CustomAlertType.error);
      uploadLoading.value = false;
      return ['', ''];
    }
  }

  Future<void> saveVideoToFirestore(Map value, String thumbnailUrl) async {
    saveLoading.value = true;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference videos = firestore.collection('posts');

    try {
      value['thumbnail'] = thumbnailUrl; // Add thumbnail URL to data
      await videos.add(value);
      saveLoading.value = false;
    } catch (e) {
      saveLoading.value = false;
    }
  }

  Future<List<String>> selectFromGallery() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    return uploadVideo(pickedFile);
  }

  Future<String> useYouTubeLink(String link) async {
    if (await canLaunchUrlString(link)) {
      return link;
    } else {
      return 'Invalid URL';
    }
  }

  @override
  void onClose() {
    // Reset progress and other variables when the controller is closed
    uploadProgress.value = 0.0;
    super.onClose();
  }
}
