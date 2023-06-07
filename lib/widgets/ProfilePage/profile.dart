import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trage_tube_flutter/controllers/auth_controller.dart';
import 'package:trage_tube_flutter/utils/vertical_spacer.dart';
import 'package:trage_tube_flutter/widgets/ProfilePage/custom_list_button.dart';
import 'package:trage_tube_flutter/widgets/ProfilePage/text_holder.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
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
          TextHolder(text: "Malik Muneeb"),
          VerticalSpacer(10),
          TextHolder(text: "malikmuneeb20@hotmail.com"),
          VerticalSpacer(30),
          CustomListButton(text: "My Videos", handler: () {}),
          const Divider(
            thickness: 2,
          ),
          CustomListButton(text: "Pending Vidoes", handler: () {}),
          const Divider(
            thickness: 2,
          ),
          CustomListButton(text: "Blocked Users", handler: () {}),
          const Divider(
            thickness: 2,
          ),
          CustomListButton(text: "Save Settings", handler: () {}),
          const Divider(
            thickness: 2,
          ),
          TextButton(
              onPressed: () {
                authController.goToLogin();
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
