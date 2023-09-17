import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:jong_q/controllers/QueueContorller.dart';
import 'package:jong_q/models/Queue.dart';
import 'package:jong_q/models/Student.dart';
import 'package:jong_q/providers/StudentProvider.dart';
import 'package:uuid/uuid.dart';

class StudentController extends GetxController {
  final RxList<Student> _student = <Student>[].obs;
  final Rx<Student> selectedStudent = Student().obs;
  final RxBool isSelected = false.obs;

  List<Student> get student => _student;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchStudent();
  }

  // fetch student
  Future<void> fetchStudent() async {
    try {
      final students = await StudentProvider.getAll();
      if (students.isNotEmpty) {
        _student.value = students;
      } else {
        _student.value = <Student>[];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getSelectStudent(String id) async {
    try {
      final student = await StudentProvider.get(id);
      if (student != null) {
        selectedStudent.value = student;
        isSelected.value = true;
      } else {
        selectedStudent.value = Student();
        isSelected.value = false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addStudent(Student newStudent) async {
    try {
      // update student list
      _student.add(newStudent);

      // show adding queue dialog
      Get.defaultDialog(
        title: 'กำลังบันทึกคิว',
        content: const Center(
            child: GFLoader(
          type: GFLoaderType.ios,
        )),
        contentPadding: const EdgeInsets.all(20),
        barrierDismissible: false,
      );

      final Queue newQueue = Queue(
        queue_id: const Uuid().v4(),
        stu_id: newStudent.stu_id,
        timestamp: DateTime.now().toString(),
        isNotify: false,
      );

      // add new queue
      await QueueController().addQueue(newQueue);

      // show success dialog
      Get.back();
      Get.defaultDialog(
        title: 'บันทึกคิวสำเร็จ',
        content: const Center(
            child: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 100,
        )),
        contentPadding: const EdgeInsets.all(20),
        barrierDismissible: false,
      );
      await Future.delayed(const Duration(milliseconds: 15000));
      Get.back();
    } catch (e) {
      rethrow;
    }
  }

  // update student
  Future<void> updateStudent(Student newStudent) async {
    try {
      // update student list
      await StudentProvider.update(newStudent.stu_id!, newStudent);
      // update selected student
      selectedStudent.value = newStudent;

      // update student list
      fetchStudent();
    } catch (e) {
      rethrow;
    }
  }
}
