import 'package:aneen/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:aneen/utils/vertical_spacer.dart';
import 'package:get/get.dart';

class SearchBarSection extends StatelessWidget {
  const SearchBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context)
          .primaryColor, // Set the background color of the column
      // height: 150, // Set the desired height of the column
      child: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 30),
        child: Column(
          children: [
            Text(
              "ANEEN",
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[200]),
            ),
            Text(
              "Publish Your Cause",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[200]),
            ),
            SizedBox(height: 20),
            SearchBar(),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  // TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: TextField(
                  onSubmitted: (value) => controller.searchVideos(value),
                  focusNode: controller.searchFocusNode,
                  controller: controller.searchEditingController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                controller
                    .searchVideos(controller.searchEditingController.text);
              },
            ),
          ],
        ));
  }
}
