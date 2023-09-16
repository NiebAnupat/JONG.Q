import 'package:get/get.dart';
import 'package:jong_q/models/Student.dart';

class StudentController extends GetxController {
  final RxList<Student> _student = <Student>[
    Student(
        stu_id: '6400922',
        stu_name: 'นายอนุภัทร แก้วมี',
        stu_tel: '0661128806'),
    Student(
        stu_id: '6400923',
        stu_name: 'นางสาวอนุภาพร ฟองสุข',
        stu_tel: '0815372341'),
    Student(
        stu_id: '6400924', stu_name: 'นายอนุภาพ ฟองสุข', stu_tel: '0815372341')
  ].obs;

  List<Student> get student => _student;

  void addStudent(Student newStudent) {}
}
