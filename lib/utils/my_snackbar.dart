import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySnackBar {
  static void success(String? message) {
    Get.snackbar("Success", message ?? "",
        backgroundColor: Colors.green, colorText: Colors.white);
  }

  static void error(String? message) {
    Get.snackbar("Error", message ?? "Unexpected error occured",
        backgroundColor: Colors.red, colorText: Colors.white);
  }
}
