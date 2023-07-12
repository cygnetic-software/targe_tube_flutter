import 'package:aneen/utils/network_image_loader.dart';

import '../../model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryWithBackground extends StatelessWidget {
  final Category category;
  final Function handler;
  const CategoryWithBackground({
    required this.category,
    required this.handler,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              width: 175, // Set the desired width
              height: 190, // Set the desired height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                // gradient: LinearGradient(
                //   colors: [
                //     Color.fromARGB(255, 0, 0, 0),
                //     Color.fromARGB(255, 50, 52, 53)
                //   ], // Set the gradient colors
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                // ),
              ),
              child: InkWell(
                onTap: () => handler(),
                child: NetworkImageLoader(
                  imageUrl: category.categoryIconUrl,
                  loader: CircularProgressIndicator(),
                ),
              )),
        ],
      ),
    );
  }
}
