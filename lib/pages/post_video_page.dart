import 'package:flutter/material.dart';

class PostVideoPage extends StatelessWidget {
  const PostVideoPage({super.key});

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
                },
              ),
            ],
          ),
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
