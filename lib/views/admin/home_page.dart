import 'package:flutter/foundation.dart';
import 'package:jong_q/components/admin/student_box.dart';
import 'package:jong_q/controllers/QueueContorller.dart';
import 'package:jong_q/controllers/StudentController.dart';
import 'package:jong_q/models/Student.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jong_q/views/admin/login_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminHome extends StatelessWidget {
  AdminHome({super.key});

  final queueController = Get.put(QueueController());
  final studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    // request SMS permission
    void requestPermission() async {
      final status = await Permission.sms.status;
      if (status.isDenied) {
        Get.snackbar(
            'ไม่สามารถเข้าถึง SMS ได้', 'กรุณาอนุญาตสิทธิ์การเข้าถึง SMS',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2));
        await Permission.sms.request();
      } else {
        if (kDebugMode) {
          print("SMS Permission Granted");
        }
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // do something
      if (kDebugMode) {
        print("Build Completed");
      }
      requestPermission();
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("JONG.Q",
            style: GoogleFonts.notoSansThai(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0))),
        centerTitle: true,
        leading: null,
        actions: [
          IconButton(
              onPressed: () {
                SharedPreferences.getInstance().then((value) {
                  value.clear();
                  Get.offAll(() => const AdminLogin());
                });
              },
              icon: const Icon(
                Icons.logout,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 30,
              )),
        ],
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 20, bottom: 10, right: 20),
              child: Obx(
                () => Row(children: [
                  Text("จำนวนคิวที่รออยู่",
                      style: GoogleFonts.notoSansThai(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0))),
                  const Spacer(),
                  Text("${queueController.queue.length}\t\t\t\t\tคิว",
                      // Text("${queueController.temp}\t\t\t\t\tคิว",
                      style: GoogleFonts.notoSansThai(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0)))
                ]),
              )),
          const Divider(
            // height: 10,
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Obx(() {
                  if (queueController.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (queueController.queue.isNotEmpty) {
                      return FutureBuilder(
                          future: queueController.getStudentInQueue(),
                          builder:
                              (context, AsyncSnapshot<List<Student>> sanpshot) {
                            if (sanpshot.hasData) {
                              return ListView.builder(
                                  itemCount: queueController.queue.length,
                                  itemBuilder: (context, index) {
                                    return StudentBox(
                                      student: sanpshot.data![index],
                                      queue: queueController.queue[index],
                                      queueController: queueController,
                                    );
                                  });
                            } else {
                              return const Center(
                                heightFactor: 13,
                                child: CircularProgressIndicator(),
                              );
                            }
                          });
                    } else {
                      return Center(
                        heightFactor: 13,
                        child: Text("ไม่มีข้อมูล",
                            style: GoogleFonts.notoSansThai(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 0, 0, 0))),
                      );
                    }
                  }
                })),
          ),
        ],
      ),
    );
  }
}
