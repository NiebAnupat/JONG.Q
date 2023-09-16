import 'package:jong_q/components/admin/student_box.dart';
import 'package:jong_q/controllers/QueueContorller.dart';
import 'package:jong_q/models/Student.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jong_q/views/admin/login_page.dart';

class AdminHome extends StatelessWidget {
  AdminHome({super.key});

  final queueController = Get.put(QueueController());

  @override
  Widget build(BuildContext context) {
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
        actions: [
          IconButton(
              onPressed: () {
                Get.off(() => const AdminLogin());
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
            padding:
                const EdgeInsets.only(top: 20, left: 20, bottom: 10, right: 20),
            child: Row(children: [
              Text("จำนวนคิวที่รออยู่",
                  style: GoogleFonts.notoSansThai(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0))),
              const Spacer(),
              Text("${queueController.queue.length}\t\t\t\t\tคิว",
                  style: GoogleFonts.notoSansThai(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0)))
            ]),
          ),
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
                    return ListView.builder(
                      itemCount: queueController.queue.length,
                      itemBuilder: (context, index) {
                        return StudentBox(
                          student: queueController.getStudentInQueue()[index],
                        );
                      },
                    );
                  }
                })),
          ),
        ],
      ),
    );
  }
}
