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
      body: SafeArea(
        child: Column(
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Text("JONG.Q",
                        style: GoogleFonts.notoSansThai(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 0, 0))),
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
                )),

            // student list
            Expanded(
              child: ListView.builder(
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return StudentBox(
                      child: name[index],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
