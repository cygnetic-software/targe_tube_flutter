import 'package:flutter/material.dart';
import 'package:trage_tube_flutter/widgets/CategoryPage/category_with_background.dart';
import 'package:trage_tube_flutter/widgets/DashboardPage/single_video_card.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleVideoCard(),
        SingleVideoCard(),
        SingleVideoCard(),
        SingleVideoCard(),
        SingleVideoCard(),
        SingleVideoCard(),
      ],
    );
  }
}
