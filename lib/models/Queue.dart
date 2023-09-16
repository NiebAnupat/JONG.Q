class Queue {
  String? queue_id;
  String? stu_id;
  String? timestamp = DateTime.now().toString();
  bool? isNotify = false;

  Queue({this.queue_id, this.stu_id, this.timestamp, this.isNotify});

  Queue.fromJson(Map<String, dynamic> json) {
    queue_id = json['queue_id'];
    stu_id = json['stu_id'];
    timestamp = json['timestamp'];
    isNotify = json['isNotify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['queue_id'] = queue_id;
    data['stu_id'] = stu_id;
    data['timestamp'] = timestamp;
    data['isNotify'] = isNotify;
    return data;
  }
}
