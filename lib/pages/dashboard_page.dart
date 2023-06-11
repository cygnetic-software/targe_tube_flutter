import 'package:flutter/material.dart';
import 'package:trage_tube_flutter/widgets/DashboardPage/search_bar_section.dart';
import 'package:trage_tube_flutter/widgets/DashboardPage/video_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: VideoCard(),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
