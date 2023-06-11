import 'package:flutter/material.dart';
import 'package:trage_tube_flutter/widgets/CategoryPage/category_with_background.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryWithBackground("AI"),
        CategoryWithBackground("AI"),
        CategoryWithBackground("AI"),
        CategoryWithBackground("AI"),
        CategoryWithBackground("AI"),
        CategoryWithBackground("AI"),
        CategoryWithBackground("AI"),
        CategoryWithBackground("AI"),
        CategoryWithBackground("AI"),
        CategoryWithBackground("AI"),
        CategoryWithBackground("AI"),
        CategoryWithBackground("AI"),
        CategoryWithBackground("AI"),
      ],
    );
  }
}
