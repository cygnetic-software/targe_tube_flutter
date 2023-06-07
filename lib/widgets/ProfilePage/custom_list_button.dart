import 'package:flutter/material.dart';

class CustomListButton extends StatelessWidget {
  var handler;

  var text;

  CustomListButton({super.key, required this.text, required this.handler});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: handler,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 18),
        )),
      ),
    );
  }
}
