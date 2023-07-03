import 'package:aneen/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aneen/home.dart';

class AneenApp extends StatelessWidget {
  const AneenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "Aneen",
        theme: ThemeData(primarySwatch: Colors.red),
        home: SafeArea(child: Home()));
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(AneenApp());
}
