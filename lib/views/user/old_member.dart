import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jong_q/lib/AppColor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jong_q/views/user/message_page.dart';
import 'package:jong_q/components/user/info_box.dart';

class OldMember extends StatelessWidget {
  const OldMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
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
                  keyboardType: TextInputType.number,
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
                  icon: const Icon(Icons.search,
                      color: Color.fromARGB(255, 255, 255, 255)),
                  label: Text(
                    "ค้นหา",
                    style: GoogleFonts.notoSansThai(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
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
                      onPressed: () {
                        editDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
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
                      backgroundColor: AppColor.primaryColor,
                      minimumSize: const Size(200, 80),
                    )),
              ],
            ),
          )
        ]))));
  }

  void editDialog(context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Center(
              child: Text(
                "แก้ไขข้อมูล",
                style: GoogleFonts.notoSansThai(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            // ignore: sized_box_for_whitespace
            content: Container(
              width: 350,
              child: Wrap(
                runSpacing: 15,
                children: [
                  // รหัสนักศึกษา
                  TextField(
                    decoration: InputDecoration(
                      labelText: "รหัสนักศึกษา",
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
                    height: 25,
                  ),

                  // ชื่อ-นามสกุล
                  TextField(
                    decoration: InputDecoration(
                      labelText: "ชื่อ-นามสกุล",
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
                    height: 25,
                  ),

                  // เบอร์โทรศัพท์
                  TextField(
                    decoration: InputDecoration(
                      labelText: "เบอร์โทรศัพท์",
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
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () => Get.back(),
                  child: Text(
                    "ยกเลิก",
                    style: GoogleFonts.notoSansThai(
                      color: Color.fromARGB(255, 215, 15, 15).withOpacity(0.8),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  )),

              // บันทึก
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "บันทึก",
                    style: GoogleFonts.notoSansThai(
                      color: Color.fromARGB(255, 17, 182, 19).withOpacity(0.8),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ))
            ],
          ));
}
