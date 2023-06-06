import 'package:flutter/material.dart';
import 'package:trage_tube_flutter/pages/login_page.dart';
import 'package:trage_tube_flutter/pages/register_page.dart';

class TargeTubeApp extends StatelessWidget {
  const TargeTubeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "TargeTube", home: SafeArea(child: LoginPage()));
  }
}

void main() {
  runApp(TargeTubeApp());
}
