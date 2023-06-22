import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trage_tube_flutter/pages/single_video_view_page.dart';

class SingleVideoCard extends StatelessWidget {
  const SingleVideoCard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      child: TextButton(
        onPressed: () {
          Get.to(SingleVideoViewPage(
              videoURL: 'https://www.youtube.com/watch?v=YRkNmN63ooI'));
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          height: 250,
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(
                height: 160,
                width: double.infinity,
                child: Placeholder(),
              ),
              SizedBox(height: 18),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "How to make Cygnetic",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Information",
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
                    "Malik Muneeb" + " - ",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "11M Views" + " - ",
                    style: TextStyle(color: Colors.black45),
                  ),
                  Text(
                    "1 day ago!",
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
