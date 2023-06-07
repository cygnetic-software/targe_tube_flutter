import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trage_tube_flutter/pages/category_page.dart';
import 'package:trage_tube_flutter/pages/dashboard_page.dart';
import 'package:trage_tube_flutter/pages/login_page.dart';
import 'package:trage_tube_flutter/pages/post_video_page.dart';
import 'package:trage_tube_flutter/pages/profile_page.dart';
import 'package:trage_tube_flutter/pages/register_page.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final index = 3.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => [
              DashboardPage(),
              CategoryPage(),
              PostVideoPage(),
              ProfilePage(),
            ][index.value]),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            showUnselectedLabels: true,
            currentIndex: index.value,
            onTap: (value) => {index.value = value},
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: "Category"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.camera), label: "Post Video"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile")
            ],
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.blueGrey,
          ),
        ));
  }
}
