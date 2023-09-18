import 'package:jong_q/models/Queue.dart';
import 'package:jong_q/providers/GoogleSheet.dart';

class QueueProvider {
  static Future create(Queue newQue) async {
    final queueSheet = await GoogleSheet.queueSheet;
    await queueSheet.values.map.appendRow(newQue.toJson());
  }

  static Future get(String id) async {
    final queueSheet = await GoogleSheet.queueSheet;
    var allRows = await queueSheet.values.map.allRows();
    if (allRows == null) {
      return null;
    }
    var queue = allRows.map((e) => Queue.fromJson(e)).firstWhere(
          (e) => e.queue_id == id && e.isNotify == false,
        );
    return queue;
  }

  static Future<List<Queue>?> getAll() async {
    final queueSheet = await GoogleSheet.queueSheet;
    var allRows = await queueSheet.values.map.allRows();
    if (allRows == null) {
      return null;
    }
    var queues = allRows.map((e) => Queue.fromJson(e)).toList();
    return queues;
  }

  static Future update(
    String id,
    Queue newQue,
  ) async {
    final queueSheet = await GoogleSheet.queueSheet;
    var allRows = await queueSheet.values.map.allRows();
    if (allRows == null) {
      return null;
    }
    var index = allRows.indexWhere((e) => e['queue_id'] == id);
    if (index == -1) {
      return null;
    }
    await queueSheet.values.map.insertRow(index + 2, newQue.toJson());
  }
}
