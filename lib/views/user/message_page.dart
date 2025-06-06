import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jong_q/controllers/StudentController.dart';
import 'package:jong_q/lib/AppColor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jong_q/models/Student.dart';
import 'package:jong_q/views/user/member_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MessagePage extends StatelessWidget {
  final int queueLength;
  MessagePage({super.key, required this.queueLength});

  final StudentController studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value) {
        studentController.isSelected.value = false;
        studentController.selectedStudent.value = Student();
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Get.off(const MemberPage());
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 30,
                )),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 35, right: 35, top: 150),
              child: Center(
                child: Column(children: [
                  Text("ดำเนินการจองคิวเสร็จสิ้น",
                      style: GoogleFonts.notoSansThai(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0))),
                  const SizedBox(
                    height: 40,
                  ),
                  Text("กรุณารอรับการแจ้งเตือน",
                      style: GoogleFonts.notoSansThai(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 0, 0, 0))),
                  Text("ผ่านทาง sms ของคุณ",
                      style: GoogleFonts.notoSansThai(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 0, 0, 0))),
                  const SizedBox(
                    height: 40,
                  ),
                  Text("จำนวนคิวก่อนหน้าคุณ",
                      style: GoogleFonts.notoSansThai(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 0, 0, 0))),
                  const SizedBox(
                    height: 30,
                  ),
                  Text("$queueLength",
                      style: GoogleFonts.notoSansThai(
                          fontSize: 30,
                          color: const Color.fromARGB(255, 0, 0, 0))),

                  const SizedBox(
                    height: 80,
                  ),

                  Text("รบกวนทำแบบประเมินความพึงพอใจ",
                      style: GoogleFonts.notoSansThai(
                          fontSize: 20, color: AppColor.primaryColor)),
                  Text("เพื่อให้ทางเรานำไปปรับปรุงให้ดียิ่งขึ้น",
                      style: GoogleFonts.notoSansThai(
                          fontSize: 20, color: AppColor.primaryColor)),

                  // button for link
                  TextButton(
                      onPressed: () async {
                        final Uri url =
                            Uri.parse('https://forms.gle/KzKRBSyq5SLWd5ar5');
                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      child: Text("เข้าสู่แบบประเมิน",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: AppColor.primaryColor))),
                ]),
              ),
            ),
          )),
    );
  }
}
