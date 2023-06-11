import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trage_tube_flutter/controllers/auth_controller.dart';
import 'package:trage_tube_flutter/global/user.dart';
import 'package:trage_tube_flutter/pages/login_page.dart';
import 'package:trage_tube_flutter/pages/register_page.dart';
import 'package:trage_tube_flutter/widgets/ProfilePage/profile.dart';

class ProfilePage extends StatelessWidget {
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Profile Page'),
      // ),
      body: Obx(() {
        switch (authController.pageState.value) {
          case PageState.login:
            return LoginPage();
          case PageState.register:
            return RegisterPage();
          case PageState.profile:
            return Profile();
          default:
            return Profile();
        }
      }),
    );
  }
}
