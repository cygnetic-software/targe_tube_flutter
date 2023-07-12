import 'package:aneen/controllers/category_controller.dart';
import 'package:aneen/widgets/DashboardPage/single_video_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBySubcategory extends StatelessWidget {
  const SearchBySubcategory({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CategoryController>();

    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 200,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${controller.selectedCategory.value} -"),
              Flexible(
                child: Text(
                  " ${controller.selectedSubcategory.value}",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: FutureBuilder(
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? Center(child: CircularProgressIndicator.adaptive())
                : ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemBuilder: (context, index) =>
                        SingleVideoCard(video: snapshot.data![index]),
                    itemCount: snapshot.data!.length);
          },
          initialData: [],
          future: controller.searchByCategorySubcategory(
              controller.selectedCategory.value,
              controller.selectedSubcategory.value),
        ),
      ),
    );
  }
}
