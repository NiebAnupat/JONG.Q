import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jong_q/lib/AppColor.dart';
import 'package:jong_q/providers/UserProvider.dart';
import 'package:jong_q/views/role_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jong_q/views/user/member_page.dart';

class UserLogin extends StatelessWidget {
  const UserLogin({super.key});

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
        await UserProvider.login(username, password);
        Get.off(() => const MemberPage());
      } catch (e) {
        Get.snackbar('เข้าสู่ระบบไม่สำเร็จ', 'กรุณาตรงสอบความถูกต้องของข้อมูล',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2));
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color(0xffFE7C28),
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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // Username
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 200),
                child: Column(
                  children: [
                    Text("นักศึกษา",
                        style: GoogleFonts.notoSansThai(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 0, 0))),
                    const SizedBox(
                      height: 35,
                    ),
                    // username
                    TextField(
                      controller: usernameController,
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
                    // buildText("Password"),
                    TextField(
                      controller: passwordController,
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
                        onPressed: login,
                        // ignore: sort_child_properties_last
                        child: Text("Login",
                            style: GoogleFonts.notoSansThai(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color:
                                    const Color.fromARGB(255, 255, 255, 255))),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColor,
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
