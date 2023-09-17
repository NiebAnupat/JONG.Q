import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:jong_q/controllers/QueueContorller.dart';
import 'package:jong_q/controllers/StudentController.dart';
import 'package:jong_q/lib/AppColor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jong_q/models/Queue.dart';
import 'package:jong_q/models/Student.dart';
import 'package:jong_q/views/user/message_page.dart';
import 'package:jong_q/components/user/info_box.dart';
import 'package:uuid/uuid.dart';

class OldMember extends StatelessWidget {
  OldMember({super.key});
  final StudentController studentController = Get.put(StudentController());
  final QueueController queueController = Get.put(QueueController());
  final idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void searchStudent() async {
      final id = idController.text;
      if (id.isEmpty) {
        Get.snackbar('กรุณากรอกรหัสนักศึกษา', '',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2));
        return;
      }

      try {
        await studentController.getSelectStudent(id);
      } catch (e) {
        studentController.isSelected.value = false;
        studentController.selectedStudent.value = Student();
        Get.snackbar('ไม่พบข้อมูลนักศึกษา', '',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2));
      }
    }

    void makeQueue() async {
      final student = studentController.selectedStudent.value;
      final newQueue = Queue(
        queue_id: const Uuid().v4(),
        stu_id: student.stu_id,
        isNotify: false,
      );

      try {
        // loading dialog
        Get.defaultDialog(
            title: 'กำลังจองคิว...',
            titlePadding: const EdgeInsets.all(20),
            titleStyle: GoogleFonts.notoSansThai(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0)),
            content: const Center(
                child: GFLoader(
              type: GFLoaderType.ios,
            )),
            contentPadding: const EdgeInsets.all(40),
            barrierDismissible: false);

        await queueController.addQueue(newQueue);

        final int queueLength =
            await queueController.getBeforeQueueLength(newQueue.queue_id!);

        studentController.isSelected.value = false;
        studentController.selectedStudent.value = Student();

        Get.off(() => MessagePage(
              queueLength: queueLength,
            ));
      } catch (e) {
        Get.snackbar('จองคิวไม่สำเร็จ', 'กรุณาลองใหม่อีกครั้ง',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2));
      }
    }

    return PopScope(
      onPopInvoked: (value) {
        idController.clear();
        studentController.isSelected.value = false;
        studentController.selectedStudent.value = Student();
      },
      child: Scaffold(
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
                    controller: idController,
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
                    onEditingComplete: searchStudent,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: searchStudent,
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
                      Obx(() => ElevatedButton(
                            onPressed: studentController.isSelected.value
                                ? () => editDialog(context)
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primaryColor,
                              minimumSize: const Size(100, 50),
                            ),
                            child: Text("แก้ไข",
                                style: GoogleFonts.notoSansThai(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255))),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  // book queue
                  // book queue
                  Obx(() => ElevatedButton(
                        onPressed: studentController.isSelected.value
                            ? () => makeQueue()
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColor,
                          minimumSize: const Size(200, 80),
                        ),
                        child: Text("จองคิว",
                            style: GoogleFonts.notoSansThai(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color:
                                    const Color.fromARGB(255, 255, 255, 255))),
                      )),
                ],
              ),
            )
          ])))),
    );
  }

  void editDialog(context) => showDialog(
      context: context,
      builder: (context) {
        final nameController = TextEditingController();
        final telController = TextEditingController();

        nameController.text = studentController.selectedStudent.value.stu_name!;
        telController.text = studentController.selectedStudent.value.stu_tel!;

        void editStudent() async {
          final student = studentController.selectedStudent.value;
          final newStudent = Student(
            stu_id: student.stu_id,
            stu_name: nameController.text,
            stu_tel: telController.text,
          );

          try {
            // check empty
            if (newStudent.stu_tel?.length != 10 || student.stu_name!.isEmpty) {
              Get.snackbar('กรุณาตรวจสอบความถูกต้องข้อมูล', '',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                  margin:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 2));
              return;
            }

            // loading dialog
            Get.defaultDialog(
                title: 'กำลังบันทึก...',
                titlePadding: const EdgeInsets.all(20),
                titleStyle: GoogleFonts.notoSansThai(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0)),
                content: const Center(
                    child: GFLoader(
                  type: GFLoaderType.ios,
                )),
                contentPadding: const EdgeInsets.all(40),
                barrierDismissible: false);
            await studentController.updateStudent(newStudent);

            Get.back();
            Get.back();
            Get.snackbar(
              'แก้ไขข้อมูลสำเร็จ',
              '',
              backgroundColor: Colors.green,
              colorText: Colors.white,
              margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 2),
            );
          } catch (e) {
            Get.snackbar('แก้ไขข้อมูลไม่สำเร็จ', 'กรุณาลองใหม่อีกครั้ง',
                backgroundColor: Colors.red,
                colorText: Colors.white,
                margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(seconds: 2));
          }
        }

        return AlertDialog(
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
          content: SizedBox(
            width: 350,
            child: Wrap(
              runSpacing: 15,
              children: [
                // รหัสนักศึกษา
                // TextField(
                //   controller: idController,
                //   keyboardType: TextInputType.number,
                //   decoration: InputDecoration(
                //     labelText: "รหัสนักศึกษา",
                //     labelStyle: GoogleFonts.notoSansThai(
                //       color:
                //           const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                //       fontSize: 18,
                //       fontWeight: FontWeight.w500,
                //       letterSpacing: 1,
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //         color:
                //             const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                //       ),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //         color:
                //             const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 25,
                // ),
                // ชื่อ-นามสกุล
                TextField(
                  controller: nameController,
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
                  height: 25,
                ),

                // เบอร์โทรศัพท์
                TextField(
                  controller: telController,
                  keyboardType: TextInputType.number,
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
                onPressed: editStudent,
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
        );
      });
}
