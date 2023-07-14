import 'package:aneen/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aneen/home.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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

class AneenWebApp extends StatelessWidget {
  const AneenWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aneen",
      theme: ThemeData(primarySwatch: Colors.red),
      home: SafeArea(child: WebHome()),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // runApp(AneenApp());
  runApp(kIsWeb ? AneenWebApp() : AneenApp());
}
