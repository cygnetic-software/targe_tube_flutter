import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProgressIndicator extends StatelessWidget {
  final String message;
  final RxDouble progress;

  const CustomProgressIndicator(
      {Key? key, required this.message, required this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Material(
        shadowColor: Theme.of(context).primaryColor,
        elevation: 2,
        child: Container(
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Please Wait",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Obx(
                    () => Center(
                      child: LinearProgressIndicator(
                        value: progress.value,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => Center(
                      child: Text(
                        (progress.value * 100).ceil().toString() + "%",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
