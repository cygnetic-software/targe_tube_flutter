import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class VideoController extends GetxController {
  final picker = ImagePicker();

  Future<String> startRecording() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.camera);
    return uploadVideo(pickedFile);
  }

  Future<String> uploadVideo(XFile? pickedFile) async {
    if (pickedFile == null) {
      return 'No file selected';
    }

    File videoFile = File(pickedFile.path);

    FirebaseStorage storage = FirebaseStorage.instance;

    try {
      // Use Dart's URI class to extract the file name
      String fileName = videoFile.uri.pathSegments.last;

      var snapshot = await storage.ref('videos/$fileName').putFile(videoFile);
      var downloadUrl = await snapshot.ref.getDownloadURL();

      await saveVideoUrlToFirestore(downloadUrl);

      return downloadUrl;
    } on FirebaseException catch (e) {
      return e.toString();
    }
  }

  Future<void> saveVideoUrlToFirestore(String videoUrl) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference videos = firestore.collection('videos');

    return videos
        .add({'url': videoUrl})
        .then((value) => print('Video Added'))
        .catchError((error) => print('Failed to add video: $error'));
  }

  Future<String> selectFromGallery() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    return uploadVideo(pickedFile);
  }

  Future<void> useYouTubeLink(String link) async {
    // Here you can validate the link if you want, then save it directly to Firestore
    await saveVideoUrlToFirestore(link);
  }
}
