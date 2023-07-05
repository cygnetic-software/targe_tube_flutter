import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aneen/pages/category_page.dart';
import 'package:aneen/pages/dashboard_page.dart';
import 'package:aneen/pages/login_page.dart';
import 'package:aneen/pages/post_video_page.dart';
import 'package:aneen/pages/profile_page.dart';
import 'package:aneen/pages/register_page.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final index = 0.obs;
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

class WebHome extends StatelessWidget {
  WebHome({super.key});
  final index = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(100), // Increase the app bar height to 120 pixels
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Padding(
            padding: EdgeInsets.only(top: 7, bottom: 7),
            child: AppBar(
              toolbarHeight: 100, // Set the desired toolbar height
              title: Text('Website Navbar'),
              centerTitle: true,
              titleSpacing: 0.0,
              leading: Container(
                height: 80, // Set the desired height of the leading image
                width: 80, // Set the desired width of the leading image
                child: Image.asset(
                  'assets/images/aneenLogo.png',
                  fit: BoxFit.cover,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    index.value = 0;
                  },
                  child: Row(
                    children: [
                      Icon(Icons.home),
                      Text("Login"),
                    ],
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor:
                        index.value == 0 ? Colors.blue : Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    index.value = 1;
                  },
                  child: Icon(Icons.category),
                  style: TextButton.styleFrom(
                    foregroundColor:
                        index.value == 1 ? Colors.blue : Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    index.value = 2;
                  },
                  child: Icon(Icons.camera),
                  style: TextButton.styleFrom(
                    foregroundColor:
                        index.value == 2 ? Colors.blue : Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    index.value = 3;
                  },
                  child: Icon(Icons.person),
                  style: TextButton.styleFrom(
                    foregroundColor:
                        index.value == 3 ? Colors.blue : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() => [
            DashboardPage(),
            CategoryPage(),
            PostVideoPage(),
            ProfilePage(),
          ][index.value]),
      bottomNavigationBar: null,
    );
  }
}
