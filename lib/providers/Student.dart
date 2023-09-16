import 'package:jong_q/models/Student.dart';
import 'package:jong_q/providers/GoogleSheet.dart';

class StudentProvider {
  static Future create(Student newStu) async {
    final studentSheet = await GoogleSheet.studentSheet;
    await studentSheet.values.map.appendRow(newStu.toJson());
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

  static Future<bool> isAlreadyExist(String id) async {
    try {
      final studentSheet = await GoogleSheet.studentSheet;
      var allRows = await studentSheet.values.map.allRows();
      if (allRows == null) {
        return false;
      }
      var student = allRows.map((e) => Student.fromJson(e)).firstWhere(
            (e) => e.stu_id == id,
          );
      if (student == null) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
