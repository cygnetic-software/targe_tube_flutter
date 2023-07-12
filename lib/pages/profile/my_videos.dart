import 'package:aneen/controllers/setting_controller.dart';
import 'package:aneen/utils/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyVideos extends StatelessWidget {
  const MyVideos({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingController>();

    return Scaffold(
      appBar: AppBar(title: Text("My Videos")),
      // body: Padding(
      //     padding: EdgeInsets.all(10),
      //     child: Obx(
      //       () => controller.loadingVideos.value
      //           ? CustomLoader(message: "Loading Videos")
      //           : ListView.builder(
      //               itemCount: 4, itemBuilder: (ctx, index) => VideoCard()),
      //     )),
    );
  }
}
