import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:aneen/utils/vertical_spacer.dart';

class SearchBarSection extends StatelessWidget {
  const SearchBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context)
          .primaryColor, // Set the background color of the column
      // height: 150, // Set the desired height of the column
      child: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 30),
        child: Column(
          children: [
            Text(
              "ANEEN",
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[200]),
            ),
            Text(
              "Publish Your Cause",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[200]),
            ),
            SizedBox(height: 20),
            SearchBar()
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  // TextEditingController _searchController;

  void performSearch(String query) {
    // Perform search functionality here
    print("Searching for: $query");
  }

  @override
  Widget build(BuildContext context) {
    bool isWeb = kIsWeb;
    double width = MediaQuery.of(context).size.width;
    if (isWeb) {
      width = width * 0.6;
    }
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                performSearch("Search");
              },
            ),
          ],
        ));
  }
}
