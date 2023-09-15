import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jong_q/views/role_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jong_q/views/admin/home_page.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Get.off(() => const RolePage());
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Color.fromARGB(255, 0, 0, 0),
                      size: 30,
                    )),
              ],
            ),
            const SizedBox(
              height: 60,
            ),

            // Username
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 150),
                child: Column(
                  children: [
                    Text("ผู้ดูแลระบบ",
                        style: GoogleFonts.notoSansThai(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 0, 0))),
                    const SizedBox(
                      height: 35,
                    ),
                    // username
                    TextField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
                      decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.8),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.8),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    // password
                    TextField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.8),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.8),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    // login button
                    ElevatedButton(
                        onPressed: () {
                          Get.to(AdminHome());
                        },
                        // ignore: sort_child_properties_last
                        child: Text("Login",
                            style: GoogleFonts.notoSansThai(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color:
                                    const Color.fromARGB(255, 255, 255, 255))),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(235, 251, 131, 57),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          minimumSize: const Size(240, 55),
                        )),
                  ],
                )),
          ],
        ),
      )),
    );
  }
}
