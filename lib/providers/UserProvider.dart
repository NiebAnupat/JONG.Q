import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jong_q/models/User.dart';
import 'package:jong_q/providers/GoogleSheet.dart';

class UserProvider {
  static Future login(String username, String password) async {
    try {
      // loading dialog
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false,
      );

      // fetch data from google sheet
      final adminSheet = await GoogleSheet.userSheet;
      var allRows = await adminSheet.values.map.allRows();
      if (allRows == null) {
        // Get.back();
        return null;
      }
      var admin = allRows
          .map((e) => User.fromJson(e))
          .firstWhere((e) => e.username == username && e.password == password);
      // Get.back();
      return admin;
    } catch (e) {
      Get.back();
      rethrow;
    }
  }
}
