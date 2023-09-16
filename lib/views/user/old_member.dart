import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jong_q/lib/MyColor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jong_q/views/user/message_page.dart';
import 'package:jong_q/components/user/info_box.dart';

class OldMember extends StatelessWidget {
  const OldMember({super.key});

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
            child: SingleChildScrollView(
                child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 50),
            child: Column(
              children: [
                Text("รหัสนักศึกษา",
                    style: GoogleFonts.notoSansThai(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0))),
                // search
                TextField(
                  decoration: InputDecoration(
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
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  label: Text(
                    "ค้นหา",
                    style: GoogleFonts.notoSansThai(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColor.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    minimumSize: const Size(120, 55),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),

                // box info
                InfoBox(),
                const SizedBox(
                  height: 10,
                ),

                // edit button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColor.primaryColor,
                        minimumSize: const Size(100, 50),
                      ),
                      child: Text("แก้ไข",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 255, 255, 255))),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),

                // book queue
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
                      backgroundColor: MyColor.primaryColor,
                      minimumSize: const Size(200, 80),
                    )),
              ],
            ),
          )
        ]))));
  }
}
