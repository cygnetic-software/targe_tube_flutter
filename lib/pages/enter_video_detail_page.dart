import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trage_tube_flutter/widgets/ConfirmationWidget/confirmation_dialogue.dart';

class EnterVideoDetailPage extends StatelessWidget {
  final List<String> categoryOptions = [
    'Category 1',
    'Category 2',
    'Category 3',
  ];

  final List<String> subcategoryOptions = [
    'Subcategory 1',
    'Subcategory 2',
    'Subcategory 3',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Enter Video Details'),
        ),
        body: Padding(
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
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: 'Select category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                value: null, // Initially no value is selected
                items: categoryOptions.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? value) {
                  // Handle category selection
                },
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
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: 'Select subcategory',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                value: null, // Initially no value is selected
                items: subcategoryOptions.map((String subcategory) {
                  return DropdownMenuItem<String>(
                    value: subcategory,
                    child: Text(subcategory),
                  );
                }).toList(),
                onChanged: (String? value) {
                  // Handle subcategory selection
                },
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.dialog(ConfirmationDialog(
                      title: 'Video Submission',
                      content: 'Your video will be posted once it is approved.',
                    )); // Show the confirmation dialog
                  },
                  child: Text(
                    'Post Free Video',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
