import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aneen/home.dart';

class TargeTubeApp extends StatelessWidget {
  const TargeTubeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(title: "Aneen", home: SafeArea(child: Home()));
  }
}

void main() {
  runApp(TargeTubeApp());
}
