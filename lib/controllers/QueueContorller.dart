import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:jong_q/models/Queue.dart';
import 'package:jong_q/models/Student.dart';
import 'package:jong_q/providers/QueueProvider.dart';
import 'package:jong_q/providers/Student.dart';

class QueueController extends GetxController {
  RxList<Queue> queue = <Queue>[].obs;
  final RxBool _isLoading = true.obs;

  RxBool get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();
    fetchQueue();
  }

  // fetch queue
  Future<void> fetchQueue() async {
    try {
      _isLoading.value = true;
      final queues = await QueueProvider.getAll();
      if (queues != null) {
        queue.value =
            queues.where((element) => element.isNotify == false).toList();
      } else {
        queue.value = [];
      }
      queue.refresh();
      _isLoading.value = false;
    } catch (e) {
      _isLoading.value = false;
      rethrow;
    }
  }

  Future<void> addQueue(Queue newQueue) async {
    await QueueProvider.create(newQueue);
  }

  // get before queue length
  Future<int> getBeforeQueueLength(String id) async {
    var beforeQueue = (await QueueProvider.getAll())
        ?.where((element) => element.isNotify == false)
        .toList();
    beforeQueue?.removeWhere((element) => element.queue_id == id);
    return beforeQueue?.length ?? 0;
  }

  void removeQueue(Queue oldQueue) async {
    //  dequeue and update
    await QueueProvider.update(
        oldQueue.queue_id!,
        Queue(
            queue_id: oldQueue.queue_id,
            stu_id: oldQueue.stu_id,
            timestamp: oldQueue.timestamp,
            isNotify: true));
    fetchQueue();
  }

  Future<List<Student>> getStudentInQueue() async {
    List<Student> students = [];
    for (var i = 0; i < queue.length; i++) {
      var student = (await StudentProvider.getAll())
          .firstWhere((element) => element.stu_id == queue[i].stu_id);
      students.add(student);
    }
    return students;
  }
}
