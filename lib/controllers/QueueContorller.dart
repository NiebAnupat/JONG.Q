import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:jong_q/controllers/StudentController.dart';
import 'package:jong_q/models/Queue.dart';
import 'package:jong_q/models/Student.dart';
import 'package:jong_q/providers/QueueProvider.dart';

class QueueController extends GetxController {
  final RxList<Queue> _queue = <Queue>[
    Queue(
      queue_id: '1',
      stu_id: '6400922',
      timestamp: DateTime.now().toString(),
      isNotify: false,
    ),
    Queue(
      queue_id: '1',
      stu_id: '6400922',
      timestamp: DateTime.now().toString(),
      isNotify: false,
    ),
  ].obs;
  final RxBool _isLoading = false.obs;

  List<Queue> get queue => _queue;
  RxBool get isLoading => _isLoading;

  Future<void> addQueue(Queue newQueue) async {
    await QueueProvider.create(newQueue);
    queue.add(newQueue);
  }

  void removeQueue(Queue oldQueue) async {
    queue.remove(oldQueue);
  }

  Future<void> updateQueue(Queue oldQueue, Queue newQueue) async {
    // queue[queue.indexOf(oldQueue)] = newQueue;
    await QueueProvider.update(oldQueue.queue_id!, newQueue);
    removeQueue(oldQueue);
  }

  void clearQueue() {
    queue.clear();
  }

  List<Student> getStudentInQueue() {
    List<Student> students = [];
    for (var i = 0; i < queue.length; i++) {
      var student = StudentController()
          .student
          .firstWhere((element) => element.stu_id == queue[i].stu_id);
      students.add(student);
    }
    return students;
  }
}
