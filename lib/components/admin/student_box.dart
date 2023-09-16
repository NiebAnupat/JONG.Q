import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jong_q/models/Student.dart';

class StudentBox extends StatelessWidget {
  final Student student;
  const StudentBox({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
      child: Container(
        height: 105,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xffFE7C28)),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: ListTile(
              title: Text(
                student.stu_name!,
                style: GoogleFonts.notoSansThai(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              subtitle: Text(
                student.stu_tel!,
                style: GoogleFonts.notoSansThai(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.message_rounded,
                    color: Colors.white,
                    size: 30,
                  )),
            )),
      ),
    );
  }
}
