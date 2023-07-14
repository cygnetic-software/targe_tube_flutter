import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aneen/pages/category_page.dart';
import 'package:aneen/pages/dashboard_page.dart';
import 'package:aneen/pages/login_page.dart';
import 'package:aneen/pages/post_video_page.dart';
import 'package:aneen/pages/profile_page.dart';
import 'package:aneen/pages/register_page.dart';
import 'package:flutter/gestures.dart';

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
        preferredSize: Size.fromHeight(80),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: AppBar(
              toolbarHeight: 80,
              title: Text('Website Navbar'),
              centerTitle: true,
              leading: Container(
                height: 80,
                width: 80,
                child: TextButton(
                  onPressed: () {
                    index.value = 0;
                  },
                  child: Image.asset(
                    'assets/images/aneenLogo.jpeg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              actions: [
                _buildActionButton(
                  icon: Icons.login,
                  label: 'Login',
                  onPressed: () {
                    index.value = 1;
                  },
                ),
                _buildActionButton(
                  icon: Icons.person_add,
                  label: 'Register',
                  onPressed: () {
                    index.value = 2;
                  },
                ),
                _buildActionButton(
                  icon: Icons.camera,
                  label: 'Post a free video',
                  onPressed: () {
                    index.value = 3;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() => [
            DashboardPageWeb(),
            ProfilePage(),
            ProfilePage(),
            PostVideoPage(),
          ][index.value]),
      bottomNavigationBar: null,
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 8),
          Text(label),
        ],
      ),
      style: TextButton.styleFrom(
        foregroundColor: index.value == 3 ? Colors.red : Colors.black,
      ),
    );
  }
}
