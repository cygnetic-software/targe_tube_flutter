import 'package:flutter/material.dart';

class CategoryWithText extends StatelessWidget {
  final String buttonName;

  const CategoryWithText(this.buttonName);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          // padding: EdgeInsets.zero,
          child: Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle button press
                print('Button pressed');
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.all(15),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  buttonName,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
