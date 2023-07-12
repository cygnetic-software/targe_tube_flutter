import 'package:aneen/controllers/category_controller.dart';
import 'package:aneen/global/categories.dart';
import 'package:aneen/model/category_model.dart';
import 'package:aneen/pages/subcategory_page.dart';
import 'package:flutter/material.dart';
import 'package:aneen/utils/vertical_spacer.dart';
import 'package:aneen/widgets/CategoryPage/category_with_background.dart';
import 'package:aneen/widgets/CategoryPage/category_with_text.dart';
import 'package:get/get.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController());
    final categoryController = Get.find<CategoryController>();
    categoryController.fetchCategories();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Categories",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VerticalSpacer(15),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Search by category",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              VerticalSpacer(15),
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
                              categoryController.selectedCategory.value =
                                  e.categoryName;
                              Get.to(() => SubcategoryPage(category: e));
                            }))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
