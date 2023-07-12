import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum CustomAlertType { success, error, warning }

void customGetAlert(String title, String message, CustomAlertType type) {
  List<Color> color = [Color(0xff4BB543), Color(0xffff3333), Color(0xffffcc00)];
  Get.snackbar(title, message,
      borderRadius: 2,
      backgroundColor: color[type.index],
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      snackPosition: SnackPosition.TOP);
}
