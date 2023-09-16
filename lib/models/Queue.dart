class Queue {
  String? queue_id;
  String? stu_id;
  String? queue_date = DateTime.now().toString();
  bool? queue_status = false;

  Queue({this.queue_id, this.stu_id, this.queue_date, this.queue_status});

  Queue.fromJson(Map<String, dynamic> json) {
    queue_id = json['queue_id'];
    stu_id = json['stu_id'];
    queue_date = json['queue_date'];
    queue_status = json['queue_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['queue_id'] = queue_id;
    data['stu_id'] = stu_id;
    data['queue_date'] = queue_date;
    data['queue_status'] = queue_status;
    return data;
  }
}
