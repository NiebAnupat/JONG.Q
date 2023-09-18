import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jong_q/lib/AppColor.dart';
import 'package:jong_q/providers/AdminProvider.dart';
import 'package:jong_q/views/admin/home_page.dart';
import 'package:jong_q/views/role_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    void login() async {
      final username = usernameController.text;
      final password = passwordController.text;

      // check if username and password is empty
      if (username.isEmpty || password.isEmpty) {
        Get.snackbar('กรุณากรอกข้อมูลให้ครบถ้วน', '',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2));
        return;
      }

      try {
        // check if username and password is correct
        await AdminProvider.login(username, password);
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setString('username', username);
        await sharedPref.setString('password', password);
        await sharedPref.setString('role', 'admin');

        Get.off(() => AdminHome());
      } catch (e) {
        Get.snackbar('เข้าสู่ระบบไม่สำเร็จ', 'กรุณาตรวจสอบความถูกต้องของข้อมูล',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2));
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
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
          Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 160),
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
                  TextField(
                    controller: usernameController,
                    style: GoogleFonts.notoSansThai(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "Username",
                      labelStyle: GoogleFonts.notoSansThai(
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
                    controller: passwordController,
                    style: GoogleFonts.notoSansThai(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: GoogleFonts.notoSansThai(
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
                        backgroundColor: AppColor.primaryColor,
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
