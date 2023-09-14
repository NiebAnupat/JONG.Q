import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'admin/login_page.dart';

class RolePage extends StatelessWidget {
  const RolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(235, 251, 131, 57),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(60),
                child: Column(
                  children: [
                    Text("Login",
                        style: GoogleFonts.notoSansThai(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255))),
                    const SizedBox(
                      height: 35,
                    ),

                    // button for admin
                    ElevatedButton(
                        onPressed: () {
                          // get to admin login page
                          Get.to(AdminLogin());
                        },
                        // ignore: sort_child_properties_last
                        child: Text("สำหรับผู้ดูแลระบบ",
                            style: GoogleFonts.notoSansThai(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 0, 0, 0))),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(235, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          minimumSize: const Size(300, 60),
                        )),
                    const SizedBox(
                      height: 24,
                    ),

                    // button for user
                    ElevatedButton(
                        onPressed: () {},
                        // ignore: sort_child_properties_last
                        child: Text("สำหรับนักศึกษา",
                            style: GoogleFonts.notoSansThai(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 0, 0, 0))),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(235, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          minimumSize: const Size(300, 60),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
