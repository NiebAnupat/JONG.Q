import 'login_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/admin/student_box.dart';

class AdminHome extends StatelessWidget {
  List<String> name = [
    "นาย ธนพล สุขใจ",
    "นางสาว สุภาพร สุขใจ",
    "นาย ปรีชา สุขใจ",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("JONG.Q",
            style: GoogleFonts.notoSansThai(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0))),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.off(() => const AdminLogin());
              },
              icon: const Icon(
                Icons.logout,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 30,
              )),
        ],
      ),
      body: SafeArea(
          child:
              // student list
              Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListView.builder(
              itemCount: name.length,
              itemBuilder: (context, index) {
                return StudentBox(
                  child: name[index],
                );
              }),
        ),
      )),
    );
  }
}
