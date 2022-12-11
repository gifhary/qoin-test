import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackbar {
  static void error(String title, String error) {
    Get.snackbar(title, error,
        backgroundColor: Colors.red[600], colorText: Colors.white);
  }

  static void succes(String title, String error) {
    Get.snackbar(title, error,
        backgroundColor: Colors.green, colorText: Colors.white);
  }
}
