import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:jong_q/controllers/QueueContorller.dart';
import 'package:jong_q/controllers/StudentController.dart';
import 'package:jong_q/lib/AppColor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jong_q/models/Queue.dart';
import 'package:jong_q/models/Student.dart';
import 'package:jong_q/providers/Student.dart';
import 'package:jong_q/views/user/message_page.dart';
import 'package:uuid/uuid.dart';

class NewMember extends StatelessWidget {
  const NewMember({super.key});

  @override
  Widget build(BuildContext context) {
    final StudentController studentController = Get.put(StudentController());
    final QueueController queueController = Get.put(QueueController());

    final nameController = TextEditingController();
    final idController = TextEditingController();
    final telephoneController = TextEditingController();

    final isChecked = false.obs;
    final newStuId = ''.obs;

    void checkStudentInfo() async {
      // check for empty field
      if (nameController.text.isEmpty ||
          idController.text.isEmpty ||
          telephoneController.text.isEmpty ||
          telephoneController.text.length != 10) {
        Get.snackbar('กรุณาตรวจสอบข้อมูล', 'ข้อมูลไม่ครบถ้วน หรือไม่ถูกต้อง',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2));
        return;
      }

      // check if student is already in the system
      final isStudentExist =
          await StudentProvider.isAlreadyExist(idController.text);
      if (isStudentExist) {
        Get.snackbar('ข้อมูลนักศึกษาซ้ำ', '',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2));
        return;
      }
      String formattedNumber = '';
      if (telephoneController.text.startsWith('0')) {
        formattedNumber = telephoneController.text.replaceFirst('0', '+66');
      } else {
        formattedNumber = '+66${telephoneController.text}';
      }
      final newStudent = Student(
          stu_id: idController.text,
          stu_name: nameController.text,
          stu_tel: formattedNumber);

      Get.defaultDialog(
          title: 'กำลังบันทึกข้อมูลนักศึกษา',
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
      await StudentProvider.create(newStudent);
      Get.back();
      // show success dialog
      Get.defaultDialog(
        title: 'บันทึกข้อมูลสำเร็จ',
        middleText:
            'รหัสนักศึกษา ${idController.text} ได้ถูกบันทึกเข้าสู่ระบบแล้ว',
        titlePadding: const EdgeInsets.all(20),
        titleStyle: GoogleFonts.notoSansThai(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 0, 0)),
        middleTextStyle: GoogleFonts.notoSansThai(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 0, 0)),
        content: const Center(
            child: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 100,
        )),
        contentPadding: const EdgeInsets.all(40),
        barrierDismissible: false,
      );
      await Future.delayed(const Duration(seconds: 2));
      isChecked.value = true;
      newStuId.value = idController.text;
      Get.back();
    }

    void makeQueueWithNewStudent() async {
      try {
        Get.defaultDialog(
            title: 'กำลังบันทึกคิว',
            titlePadding: const EdgeInsets.all(20),
            titleStyle: GoogleFonts.notoSansThai(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0)),
            content: const Center(
                child: GFLoader(
              type: GFLoaderType.ios,
            )),
            contentPadding: const EdgeInsets.all(20),
            barrierDismissible: false);
        final newQueue = Queue(
          queue_id: const Uuid().v4(),
          stu_id: newStuId.value,
          timestamp: DateTime.now().toString(),
          isNotify: false,
        );
        await queueController.addQueue(newQueue);
        Get.back();
        Get.defaultDialog(
          title: 'บันทึกคิวสำเร็จ',
          titlePadding: const EdgeInsets.all(20),
          titleStyle: GoogleFonts.notoSansThai(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0)),
          content: const Center(
              child: Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 100,
          )),
          contentPadding: const EdgeInsets.all(20),
          barrierDismissible: false,
        );
        await Future.delayed(const Duration(seconds: 2));
        Get.back();
        Get.off(() => const MessagePage());
      } catch (e) {
        Get.back();
        Get.snackbar('เกิดข้อผิดพลาด', 'ไม่สามารถจองคิวได้',
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
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 120),
            child: Column(
              children: [
                Text("นักศึกษารายใหม่",
                    style: GoogleFonts.notoSansThai(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0))),
                const SizedBox(
                  height: 20,
                ),

                // name and surname
                TextField(
                  controller: nameController,
                  style: GoogleFonts.notoSansThai(
                      color: const Color.fromARGB(255, 0, 0, 0), fontSize: 20),
                  decoration: InputDecoration(
                    labelText: "ชื่อ - นามสกุล",
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
                  height: 20,
                ),

                // id
                TextField(
                  controller: idController,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.notoSansThai(
                      color: const Color.fromARGB(255, 0, 0, 0), fontSize: 20),
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
                  controller: telephoneController,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.notoSansThai(
                      color: const Color.fromARGB(255, 0, 0, 0), fontSize: 20),
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
                const SizedBox(
                  height: 35,
                ),

                // submit button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: checkStudentInfo,
                        // ignore: sort_child_properties_last
                        child: Text("ยืนยัน",
                            style: GoogleFonts.notoSansThai(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color:
                                    const Color.fromARGB(255, 255, 255, 255))),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColor,
                          minimumSize: const Size(115, 60),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 140,
                ),

                // book queue
                Obx(
                  () => ElevatedButton(
                    onPressed: isChecked.value ? makeQueueWithNewStudent : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      minimumSize: const Size(200, 80),
                    ),
                    child: Text("จองคิว",
                        style: GoogleFonts.notoSansThai(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255))),
                  ),
                )
              ],
            ),
          )
        ]))));
  }
}
