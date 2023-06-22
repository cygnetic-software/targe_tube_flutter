import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trage_tube_flutter/pages/report_content_page.dart';

class VideoDescription extends StatelessWidget {
  const VideoDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "How to make Cygnetic",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Malik Muneeb" + " - ",
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Category" + " - ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
              Text(
                "Sub Category",
                style: TextStyle(color: Colors.black45),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.remove_red_eye,
                    color: Colors.black45,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "11M Views",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle share button tap
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.share,
                            color: Colors.black45,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Share",
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    TextButton(
                      onPressed: () {
                        Get.to(ReportContentPage());
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.report,
                            color: Colors.black45,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Report",
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Uploader Details",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Name: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Malik Muneeb",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black45),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Email: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "malikmuneeb20@hotmail.com",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
