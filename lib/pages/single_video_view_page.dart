import 'package:flutter/material.dart';
import 'package:trage_tube_flutter/widgets/SingleVideoViewPage/video_description.dart';

class SingleVideoViewPage extends StatelessWidget {
  final String videoURL;

  const SingleVideoViewPage({required this.videoURL});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Single video")),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          height: double.infinity,
          width: double.infinity,
          // padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(
                height: 160,
                width: double.infinity,
                child: Placeholder(),
              ),
              SizedBox(height: 18),
              VideoDescription()
            ],
          ),
        ),
      ),
    );
  }
}
