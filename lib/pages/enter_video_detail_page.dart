import 'package:aneen/controllers/category_controller.dart';
import 'package:aneen/controllers/upload_video_controller.dart';
import 'package:aneen/global/categories.dart';
import 'package:aneen/global/user.dart';
import 'package:aneen/home.dart';
import 'package:aneen/model/video_model.dart';
import 'package:aneen/utils/custom_loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aneen/widgets/ConfirmationWidget/confirmation_dialogue.dart';

class EnterVideoDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final videoController = Get.find<VideoController>();
    final categoryController = Get.find<CategoryController>();
    categoryController.fetchCategories();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Enter Video Details'),
        ),
        body: Obx(
          () => categoryController.loadingCategories.value
              ? CustomLoader(message: "Loading categories")
              : videoController.saveLoading.value
                  ? CustomLoader(message: "Saving video details")
                  : SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Title',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                controller: videoController.titleController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Title cannot be empty";
                                  } else if (value!.length < 8 &&
                                      value.length > 30) {
                                    return "Title should be between 8 - 30 characters";
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: 'Enter title',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Category',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8),
                              Obx(
                                () => DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    hintText: 'Select category',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  value: null,
                                  items: categories.map((category) {
                                    return DropdownMenuItem<String>(
                                      value: category.categoryName,
                                      child: Text(category.categoryName),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    // Handle category selection

                                    print(value);
                                    videoController.categoryController.value =
                                        value.toString();
                                    videoController
                                            .subcategoryController.value =
                                        ""; // Reset subcategory value when category changes
                                  },
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Subcategory',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8),
                              Obx(
                                () => DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    hintText: 'Select subcategory',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  value: videoController
                                          .subcategoryController.value.isEmpty
                                      ? null
                                      : videoController
                                          .subcategoryController.value,
                                  items: videoController
                                          .categoryController.value.isNotEmpty
                                      ? categories
                                          .firstWhere((element) =>
                                              element.categoryName ==
                                              videoController
                                                  .categoryController.value)
                                          .subcategories
                                          .map((subcategory) {
                                            return DropdownMenuItem<String>(
                                              value: subcategory as String,
                                              child: Text(subcategory),
                                            );
                                          })
                                          .toSet()
                                          .toList() // Convert to Set and then back to List to remove duplicate values
                                      : [],
                                  onChanged: (String? value) {
                                    // Handle subcategory selection
                                    videoController.subcategoryController
                                        .value = value.toString();
                                  },
                                ),
                              ),
                              SizedBox(height: 16),
                              Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      if (videoController
                                          .categoryController.value.isEmpty) {
                                        Get.snackbar(
                                            "Error", "Select a category!");
                                        print(
                                            "selected category ${videoController.categoryController.value}");
                                      } else if (videoController
                                          .subcategoryController
                                          .value
                                          .isEmpty) {
                                        Get.snackbar(
                                            "Error", "Select a subcategory!");
                                      } else {
                                        final VideoModel data =
                                            VideoModel.fromJson({
                                          "date_uploaded": Timestamp.now(),
                                          "is_pending": true,
                                          "views": 0,
                                          "url":
                                              videoController.videoLink.value,
                                          "reports": [],
                                          "uploader_details": {
                                            "name": user.value.username,
                                            "email": user.value.email
                                          },
                                          "uploader_id": user.value.id,
                                          "title": videoController
                                              .titleController.text,
                                          "description": "",
                                          "category": videoController
                                              .categoryController.value,
                                          "subcategory": videoController
                                              .subcategoryController.value
                                        });
                                        data.thumbnail =
                                            videoController.thumbnailLink.value;

                                        await videoController
                                            .saveVideoToFirestore(data.toJson(),
                                                data.thumbnail.toString());
                                        Get.offAll(() => Home());
                                      }
                                    }
                                  },
                                  child: Text(
                                    'Post Free Video',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}
