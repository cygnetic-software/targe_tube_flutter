import 'package:flutter/material.dart';
import 'package:trage_tube_flutter/utils/vertical_spacer.dart';
import 'package:trage_tube_flutter/widgets/CategoryPage/category_with_background.dart';
import 'package:trage_tube_flutter/widgets/CategoryPage/category_with_text.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Category",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   // width: double.infinity,
              //   child: Text(
              //     "Category",
              //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              //   ),
              // ),
              VerticalSpacer(25),
              Container(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runSpacing: 10.0, // Set the spacing between the rows
                  children: [
                    CategoryWithText('AI'),
                    // VerticalSpacer(10),
                    CategoryWithText("Arts"),
                    // VerticalSpacer(10),
                    CategoryWithText("Events"),
                    // VerticalSpacer(10),
                    // VerticalSpacer(20),
                  ],
                ),
              ),
              VerticalSpacer(25),
              Container(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runSpacing: 10.0, // Set the spacing between the rows
                  children: [
                    CategoryWithBackground("AI"),
                    CategoryWithBackground("AI"),
                    CategoryWithBackground("AI"),
                    CategoryWithBackground("AI"),
                    CategoryWithBackground("AI"),
                    CategoryWithBackground("AI"),
                    CategoryWithBackground("AI"),
                    CategoryWithBackground("AI"),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
