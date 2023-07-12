import 'package:flutter/material.dart';

class CategoryWithText extends StatelessWidget {
  final String buttonName;
  final Function onPressed;
  const CategoryWithText({
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 10),
          child: ElevatedButton(
            onPressed: () {
              onPressed();
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
                  color: Theme.of(context).primaryColor,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
