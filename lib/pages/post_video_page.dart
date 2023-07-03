import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aneen/pages/enter_video_detail_page.dart';

class PostVideoPage extends StatelessWidget {
  const PostVideoPage({Key? key});

  void _showBottomModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(16.0),
            children: [
              ListTile(
                leading: Icon(Icons.videocam),
                title: Text('Start Recording'),
                onTap: () {
                  // Handle start recording action
                  print('Start recording');
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.upload_file),
                title: Text('Upload Video'),
                onTap: () {
                  // Handle upload video action
                  print('Upload video');
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.link),
                title: Text('Use YouTube Link'),
                onTap: () {
                  // Handle use YouTube link action
                  print('Use YouTube link');
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
        return AlertDialog(
          title: Text(
            'Please enter a YouTube Video URL',
            style: TextStyle(fontSize: 15),
          ),
          content: TextFormField(
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
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle submit button tap
                // You can access the YouTube URL using the TextFormField's value
                Navigator.pop(context); // Close the dialog
                Get.to(
                    EnterVideoDetailPage()); // Navigate to the details screen
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Post Video",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
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
      ),
    );
  }
}
