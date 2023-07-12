import 'package:aneen/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:aneen/widgets/DashboardPage/single_video_card.dart';
import 'package:aneen/widgets/DashboardPage/search_bar_section.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    final dashboardController = Get.find<DashboardController>();
    return Scaffold(
        body: Obx(
      () => RefreshIndicator(
        onRefresh: dashboardController.fetchData,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Home",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SearchBarSection(),
                  ],
                ),
              ),
              pinned: false,
              floating: true,
            ),
            SliverList.builder(
              itemBuilder: (context, index) =>
                  SingleVideoCard(video: dashboardController.videos[index]),
              itemCount: dashboardController.videos.length,
            ),
          ],
        ),
      ),
    ));
  }
}
