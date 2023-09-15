import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jong_q/views/user/message_page.dart';

class NewMember extends StatelessWidget {
  const NewMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(235, 251, 131, 57),
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
            child: SingleChildScrollView(
                child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 180),
            child: Column(
              children: [
                // name and surname
                TextField(
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
                  decoration: InputDecoration(
                    labelText: "ชื่อ - นามสกุล",
                    labelStyle: TextStyle(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // id
                TextField(
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
                  decoration: InputDecoration(
                    labelText: "รหัสนักศึกษา",
                    labelStyle: TextStyle(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // telephone
                TextField(
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
                  decoration: InputDecoration(
                    labelText: "เบอร์โทรศัพท์",
                    labelStyle: TextStyle(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),

                // submit button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        // ignore: sort_child_properties_last
                        child: Text("ยืนยัน",
                            style: GoogleFonts.notoSansThai(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color:
                                    const Color.fromARGB(255, 255, 255, 255))),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(235, 251, 131, 57),
                          minimumSize: const Size(115, 60),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 160,
                ),

                // book queue
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => const MessagePage());
                    },
                    // ignore: sort_child_properties_last
                    child: Text("จองคิว",
                        style: GoogleFonts.notoSansThai(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255))),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(235, 251, 131, 57),
                      minimumSize: const Size(200, 80),
                    )),
              ],
            ),
          )
        ]))));
  }
}
