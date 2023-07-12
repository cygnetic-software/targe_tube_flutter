import 'package:aneen/controllers/category_controller.dart';
import 'package:aneen/controllers/upload_video_controller.dart';
import 'package:aneen/global/user.dart';
import 'package:aneen/utils/custom_loader.dart';
import 'package:aneen/utils/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aneen/pages/enter_video_detail_page.dart';

class PostVideoPage extends StatelessWidget {
  const PostVideoPage({Key? key});

  void _showBottomModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final videoController = Get.find<VideoController>();
        return Container(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(16.0),
            children: [
              ListTile(
                leading: Icon(Icons.videocam),
                title: Text('Start Recording'),
                onTap: () async {
                  // Handle start recording action
                  print('Start recording');
                  Navigator.pop(context);
                  final url = await videoController.startRecording();
                  if (url.isNotEmpty) {
                    return Get.to(EnterVideoDetailPage());
                  }
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.upload_file),
                title: Text('Upload Video'),
                onTap: () async {
                  Navigator.pop(context); // Close the bottom sheet
                  final url = await videoController.selectFromGallery();
                  if (url.isNotEmpty) {
                    videoController.videoLink.value = url[0];
                    videoController.thumbnailLink.value = url[1];
                    return Get.to(EnterVideoDetailPage());
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.link),
                title: Text('Use YouTube Link'),
                onTap: () {
                  // Handle use YouTube link
                  Navigator.pop(context); // Close the bottom sheet
                  _showYouTubeLinkModal(
                      context); // Show the YouTube link input modal
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showYouTubeLinkModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final formKey = GlobalKey<FormState>();
        final textController = TextEditingController();
        final videoController = Get.find<VideoController>();
        return AlertDialog(
          title: Text(
            'Please enter a YouTube Video URL',
            style: TextStyle(fontSize: 15),
          ),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Enter URL',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a YouTube Video URL';
                }
                return null;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  videoController.videoLink.value =
                      await videoController.useYouTubeLink(textController.text);
                  textController.text = "";
                  if (videoController.videoLink.value.isEmpty) {
                    return;
                  }
                  Navigator.pop(context); // Close the dialog
                  Get.to(
                      EnterVideoDetailPage()); // Navigate to the details screen
                }
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(VideoController());

    Get.put(CategoryController());
    final controller = Get.find<VideoController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Post Video",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Obx(
        () {
          if (controller.uploadLoading.value) {
            return CustomLoader(message: "Loading");
          } else if (controller.uploadProgress.value > 0.0) {
            return CustomProgressIndicator(
                message: "Uploading video",
                progress: controller.uploadProgress);
          } else {
            return user.value.id.isEmpty
                ? Center(
                    child: Text("Please login or register to post a video..."),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            _showBottomModal(context);
                          },
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.fiber_manual_record,
                                    size: 65,
                                    color: Colors.black,
                                  ),
                                  Icon(
                                    Icons.fiber_manual_record,
                                    size: 55,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              Text(
                                'Start Recording',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          }
        },
      ),
    );
  }
}
