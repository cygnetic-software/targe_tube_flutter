import 'package:aneen/model/video_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aneen/pages/single_video_view_page.dart';

class SingleVideoCard extends StatelessWidget {
  const SingleVideoCard({Key? key, required this.video});
  final VideoModel video;
  String timeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return difference.inMinutes == 1
          ? '${difference.inMinutes} minute ago'
          : '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return difference.inHours == 1
          ? '${difference.inHours} hour ago'
          : '${difference.inHours} hours ago';
    } else if (difference.inDays < 30) {
      return difference.inDays == 1
          ? '${difference.inDays} day ago'
          : '${difference.inDays} days ago';
    } else if (difference.inDays < 365) {
      int months = difference.inDays ~/ 30; // Approximate calculation
      return months == 1 ? '${months} month ago' : '${months} months ago';
    } else {
      int years = difference.inDays ~/ 365; // Approximate calculation
      return years == 1 ? '${years} year ago' : '${years} years ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isWeb = kIsWeb;
    double width = MediaQuery.of(context).size.width;
    if (isWeb) {
      width = 400;
    }
    return Material(
      elevation: 3.0,
      child: TextButton(
        onPressed: () {
          Get.to(SingleVideoViewPage(video: video));
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          height: 250,
          width: width,
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(
                height: 160,
                width: double.infinity,
                child: Image.network(
                  video.thumbnail.toString(),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 18),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      video.title,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      video.category,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    video.uploaderDetails["name"] + " - ",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    video.views.toString() + " Views" + " - ",
                    style: TextStyle(color: Colors.black45),
                  ),
                  Text(
                    timeAgo(video.dateUploaded),
                    style: TextStyle(color: Colors.black45),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
