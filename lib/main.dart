import 'package:get/get.dart';
import 'package:jong_q/views/admin/home_page.dart';
import 'package:jong_q/views/user/member_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'views/role_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(InitControl());
    return GetMaterialApp(
      title: 'JONG.Q',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const RolePage(),
    );
  }
}

class InitControl extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  void checkLogin() async {
    final sharedPref = await SharedPreferences.getInstance();
    final role = sharedPref.getString('role');
    if (role == 'admin') {
      Get.off(() => AdminHome());
    } else if (role == 'user') {
      Get.off(() => const MemberPage());
    }
  }
}
