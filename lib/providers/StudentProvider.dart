import 'package:get/get.dart';
import 'package:jong_q/models/Student.dart';
import 'package:jong_q/providers/GoogleSheet.dart';

class StudentProvider {
  static Future create(Student newStu) async {
    try {
      final studentSheet = await GoogleSheet.studentSheet;
      await studentSheet.values.map.appendRow(newStu.toJson());
    } catch (e) {
      Get.back();
      rethrow;
    }
  }

  static Future get(String id) async {
    final studentSheet = await GoogleSheet.studentSheet;
    var allRows = await studentSheet.values.map.allRows();
    if (allRows == null) {
      return null;
    }
    var student = allRows.map((e) => Student.fromJson(e)).firstWhere(
          (e) => e.stu_id == id,
        );
    return student;
  }

  static Future<List<Student>> getAll() async {
    try {
      final studentSheet = await GoogleSheet.studentSheet;
      var allRows = await studentSheet.values.map.allRows();
      if (allRows == null) {
        return [];
      }
      var students = allRows.map((e) => Student.fromJson(e)).toList();
      return students;
    } catch (e) {
      return [];
    }
  }

  // update student
  static Future update(String id, Student newStu) async {
    try {
      final studentSheet = await GoogleSheet.studentSheet;
      var allRows = await studentSheet.values.map.allRows();
      if (allRows == null) {
        return null;
      }

      var index = allRows.indexWhere((e) => e['stu_id'] == id);
      if (index == -1) {
        return null;
      }
      await studentSheet.values.map.insertRow(index + 3, newStu.toJson());
      await studentSheet.deleteRow(index + 2);
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> isAlreadyExist(String id) async {
    try {
      final studentSheet = await GoogleSheet.studentSheet;
      var allRows = await studentSheet.values.map.allRows();
      if (allRows == null) {
        return false;
      }
      var student = allRows.map((e) => Student.fromJson(e)).firstWhere(
            (e) => e.stu_id == id,
            orElse: () => Student(),
          );
      if (student.stu_id == null) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
