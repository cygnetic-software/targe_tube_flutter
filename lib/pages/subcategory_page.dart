import 'package:aneen/controllers/category_controller.dart';
import 'package:aneen/model/category_model.dart';
import 'package:aneen/pages/search_by_subcategory.dart';
import 'package:aneen/widgets/CategoryPage/category_with_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubcategoryPage extends StatelessWidget {
  final Category category;
  const SubcategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CategoryController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Subcategories",
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: ListView.builder(
            itemBuilder: (context, index) => CategoryWithText(
                buttonName: category.subcategories[index],
                onPressed: () {
                  controller.selectedSubcategory(category.subcategories[index]);
                  Get.off(() => SearchBySubcategory());
                }),
            itemCount: category.subcategories.length,
          ),
        ),
      ),
    );
  }
}
