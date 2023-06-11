import 'package:flutter/material.dart';

class SingleVideoCard extends StatelessWidget {
  const SingleVideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        height: 250,
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(height: 120, width: double.infinity, child: Placeholder()),
            SizedBox(
              height: 18,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "How to make Cygnetic",
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Information",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface",
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "1 day ago!",
              style: TextStyle(color: Colors.black45),
            )
          ],
        ),
      ),
    );
  }
}
