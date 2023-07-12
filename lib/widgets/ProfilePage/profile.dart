import 'package:aneen/controllers/setting_controller.dart';
import 'package:aneen/pages/profile/blocked_users.dart';
import 'package:aneen/pages/profile/my_videos.dart';
import 'package:aneen/pages/profile/pending_videos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aneen/controllers/auth_controller.dart';
import 'package:aneen/utils/vertical_spacer.dart';
import 'package:aneen/widgets/ProfilePage/custom_list_button.dart';
import 'package:aneen/widgets/ProfilePage/text_holder.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());
    final authController = Get.find<AuthController>();
    final controller = Get.find<SettingController>();
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Your Account",
              style: TextStyle(fontSize: 24),
            ),
            alignment: Alignment.centerLeft,
          ),
          VerticalSpacer(10),
          Obx(
            () => TextHolder(text: controller.name.value),
          ),
          VerticalSpacer(10),
          Obx(
            () => TextHolder(text: controller.email.value),
          ),
          VerticalSpacer(30),
          CustomListButton(
              text: "My Videos",
              handler: () {
                Get.to(() => MyVideos());
              }),
          const Divider(
            thickness: 2,
          ),
          CustomListButton(
              text: "Pending Vidoes",
              handler: () {
                Get.to(() => PendingVideos());
              }),
          const Divider(
            thickness: 2,
          ),
          CustomListButton(
              text: "Blocked Users",
              handler: () {
                Get.to(() => BlockedUsers());
              }),
          const Divider(
            thickness: 2,
          ),
          CustomListButton(text: "Save Settings", handler: () {}),
          const Divider(
            thickness: 2,
          ),
          TextButton(
              onPressed: () {
                authController.signOut();
              },
              child: Text(
                "Logout",
                style: TextStyle(fontSize: 16),
              ))
        ],
      ),
    );
  }
}
