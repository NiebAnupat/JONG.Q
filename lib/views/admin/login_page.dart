import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jong_q/lib/MyColor.dart';
import 'package:jong_q/views/admin/home_page.dart';
import 'package:jong_q/views/role_page.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    void login() async {
      Get.off(() => AdminHome());
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.primaryColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.off(() => const RolePage());
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 30,
            )),
      ),
      body: Column(
        children: [
          // Username
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 200),
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
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
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
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
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
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColor.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        minimumSize: const Size(240, 55),
                      ),
                      child: Text("Login",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color:
                                  const Color.fromARGB(255, 255, 255, 255)))),
                ],
              )),
        ],
      ),
    );
  }
}
