import 'dart:collection' as collection;

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:jong_q/controllers/StudentController.dart';
import 'package:jong_q/models/Queue.dart';
import 'package:jong_q/models/Student.dart';
import 'package:jong_q/providers/QueueProvider.dart';

class QueueController extends GetxController {
  final Rx<collection.Queue<Queue>> _queue = collection.Queue<Queue>().obs;
  final RxBool _isLoading = false.obs;

  Rx<collection.Queue<Queue>> get queue => _queue;
  RxBool get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();
    _queue.value.addLast(Queue(
      queue_id: '1',
      stu_id: '6400922',
      timestamp: DateTime.now().toString(),
      isNotify: false,
    ));
    _queue.value.addLast(Queue(
      queue_id: '2',
      stu_id: '6400923',
      timestamp: DateTime.now().toString(),
      isNotify: false,
    ));
  }

  Future<void> addQueue(Queue newQueue) async {
    await QueueProvider.create(newQueue);
    _queue.value.add(newQueue);
    // queue.add(newQueue);
  }

  void removeQueue(Queue oldQueue) async {
    // queue.remove(oldQueue);
    _queue.value.remove(oldQueue);
  }

  void clearQueue() {
    // queue.clear();
    _queue.value.clear();
  }

  List<Student> getStudentInQueue() {
    List<Student> students = [];
    for (var i = 0; i < queue.value.length; i++) {
      var student = StudentController().student.firstWhere(
          (element) => element.stu_id == queue.value.elementAt(i).stu_id);
      students.add(student);
    }
    return students;
  }
}
