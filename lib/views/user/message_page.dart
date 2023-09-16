import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jong_q/lib/MyColor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColor.primaryColor,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 30,
              )),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 200),
            child: Center(
              child: Column(children: [
                Text("ดำเนินการจองคิวเสร็จสิ้น",
                    style: GoogleFonts.notoSansThai(
                        fontSize: 30,
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
                  height: 80,
                ),

                Text("รบกวรทำแบบประเมิณความพึงพอใจ",
                    style: GoogleFonts.notoSansThai(
                        fontSize: 20, color: MyColor.primaryColor)),
                Text("เพื่อให้ทางเรานำไปปรับปรุงให้ดียิ่งขึ้น",
                    style: GoogleFonts.notoSansThai(
                        fontSize: 20, color: MyColor.primaryColor)),

                // button for link
                TextButton(
                    onPressed: () async {
                      final Uri url =
                          Uri.parse('https://forms.gle/KzKRBSyq5SLWd5ar5');
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    child: Text("เข้าสู่แบบประเมิณ",
                        style: GoogleFonts.notoSansThai(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: MyColor.primaryColor))),
              ]),
            ),
          ),
        ));
  }
}
