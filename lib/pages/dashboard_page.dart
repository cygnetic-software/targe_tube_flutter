import 'package:aneen/controllers/dashboard_controller.dart';
import 'package:aneen/widgets/DashboardPage/footer_bar_section.dart';
import 'package:flutter/material.dart';
import 'package:aneen/widgets/DashboardPage/single_video_card.dart';
import 'package:aneen/widgets/DashboardPage/search_bar_section.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aneen/controllers/category_controller.dart';
import 'package:aneen/global/categories.dart';
import 'package:aneen/model/category_model.dart';
import 'package:aneen/utils/vertical_spacer.dart';
import 'package:aneen/widgets/CategoryPage/category_with_background.dart';

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

class DashboardPageWeb extends StatelessWidget {
  const DashboardPageWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController());
    final categoryController = Get.find<CategoryController>();
    categoryController.fetchCategories();

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
                      SearchBarSection(),
                    ],
                  ),
                ),
                pinned: false,
                floating: true,
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Obx(
                      () => Container(
                        width: double.infinity,
                        child: Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runSpacing: 10.0, // Set the spacing between the rows
                          children: categories
                              .map((e) => CategoryWithBackground(
                                    category: e,
                                    handler: () {
                                      print("Hello");
                                    },
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "Videos",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        runSpacing: 10.0, // Gap between rows
                        spacing: 10.0, // Gap between columns
                        runAlignment:
                            WrapAlignment.start, // Align rows to the left
                        children: dashboardController.videos
                            .map((video) => SingleVideoCard(video: video))
                            .toList(),
                      ),
                    ),
                    VerticalSpacer(30),
                    FooterBarSection()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
