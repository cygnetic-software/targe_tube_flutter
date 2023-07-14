import 'package:aneen/controllers/setting_controller.dart';
import 'package:aneen/utils/custom_loader.dart';
import 'package:aneen/widgets/DashboardPage/single_video_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyVideos extends StatelessWidget {
  const MyVideos({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingController>();

    return Scaffold(
        appBar: AppBar(title: Text("My Videos")),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: FutureBuilder(
                future: controller.getVideos(),
                builder: (context, snapshot) {
                  print(snapshot.data);
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  return !snapshot.hasData
                      ? Center(
                          child: Text("You haven't posted any video!"),
                        )
                      : snapshot.data!.length == 0
                          ? Center(
                              child: Text("You haven't posted any video!"),
                            )
                          : ListView.builder(
                              itemCount: 4,
                              itemBuilder: (ctx, index) => SingleVideoCard(
                                  video: snapshot.data![index]));
                })));
  }
}
