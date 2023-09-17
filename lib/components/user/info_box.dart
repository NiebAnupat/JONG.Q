import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jong_q/controllers/StudentController.dart';

class InfoBox extends StatelessWidget {
  InfoBox({super.key});

  final StudentController studentController = Get.put(StudentController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "ข้อมูลนักศึกษา",
                style: GoogleFonts.notoSansThai(
                    fontSize: 24, color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              const SizedBox(
                height: 45,
              ),
              // รหัสนักศึกษา
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("รหัสนักศึกษา : ",
                      style: GoogleFonts.notoSansThai(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 0, 0, 0))),
                  const SizedBox(
                    width: 20,
                  ),
                  Obx(() => Text(
                        studentController.selectedStudent.value.stu_id ?? "",
                        style: GoogleFonts.notoSansThai(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                      )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              // ชื่อ-นามสกุล
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("ชื่อ-นามสกุล : ",
                      style: GoogleFonts.notoSansThai(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 0, 0, 0))),
                  const SizedBox(
                    width: 25,
                  ),
                  SizedBox(
                    width: 160,
                    child: Obx(() => Text(
                          studentController.selectedStudent.value.stu_name ??
                              "",
                          // FIX: ovelflow not working
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.notoSansThai(
                              fontSize: 18,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              // เบอร์โทรศัพท์
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("เบอร์โทรศัพท์ : ",
                      style: GoogleFonts.notoSansThai(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 0, 0, 0))),
                  const SizedBox(
                    width: 18,
                  ),
                  Obx(() => Text(
                        studentController.selectedStudent.value.stu_tel ?? "",
                        style: GoogleFonts.notoSansThai(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
