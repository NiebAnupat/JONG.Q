import 'package:get/get.dart';
import 'views/role_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JONG.Q',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const RolePage(),
    );
  }
}
