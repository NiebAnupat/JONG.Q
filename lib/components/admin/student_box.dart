import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsheets/gsheets.dart';
import 'package:jong_q/controllers/QueueContorller.dart';
import 'package:jong_q/models/Queue.dart';
import 'package:jong_q/models/Student.dart';
import 'package:permission_handler/permission_handler.dart' as p;
import 'package:background_sms/background_sms.dart';

class StudentBox extends StatelessWidget {
  final Student student;
  final Queue queue;
  final QueueController queueController;
  const StudentBox(
      {super.key,
      required this.student,
      required this.queue,
      required this.queueController});

  @override
  Widget build(BuildContext context) {
    void sendSMS() async {
      if (await p.Permission.sms.status.isGranted) {
        final phoneNumber = student.stu_tel!;
        final message =
            'แจ้งนักศึกษา ชื่อ ${student.stu_name}\nรหัสนักศึกษา ${student.stu_id}\nขณะนี้กำลังจะถึงคิวของคุณแล้ว\nกรุณาเดินทางมาส่งเอกสารภายใน 10 นาที\n*หากไม่มาภายในเวลาที่กำหนดขออนุญาตเรียกคิวถัดไป';
        SmsStatus result = await BackgroundSms.sendMessage(
            phoneNumber: phoneNumber, message: message);

        if (result == SmsStatus.sent) {
          Get.snackbar(
              'ส่ง SMS สำเร็จ', 'ส่ง SMS ไปยัง ${student.stu_name} แล้ว',
              backgroundColor: Colors.green,
              colorText: Colors.white,
              margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 2));

          //  dequeue and update
          queueController.removeQueue(queue);
        } else {
          Get.snackbar('ส่ง SMS ไม่สำเร็จ', 'กรุณาลองใหม่อีกครั้ง',
              backgroundColor: Colors.red,
              colorText: Colors.white,
              margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 2));
        }
      } else {
        Get.snackbar(
            'ไม่สามารถเข้าถึง SMS ได้', 'กรุณาเปิดสิทธิ์การเข้าถึง SMS',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2));
        await p.Permission.sms.request();
      }
    }

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
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                student.stu_tel!,
                style: GoogleFonts.notoSansThai(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              trailing: IconButton(
                  onPressed: sendSMS,
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
