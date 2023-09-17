class Student {
  String? stu_id;
  String? stu_name;
  String? stu_tel;

  Student({this.stu_id, this.stu_name, this.stu_tel});

  Student.fromJson(Map<String, dynamic> json) {
    stu_id = json['stu_id'];
    stu_name = json['stu_name'];
    stu_tel = formatTel(json['stu_tel']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stu_id'] = stu_id;
    data['stu_name'] = stu_name;
    data['stu_tel'] = stu_tel;
    return data;
  }

  // fucntion to format tel number change first +66 to 0 use with json['stu_tel']
  String formatTel(String tel) {
    if (tel.startsWith('66')) {
      return tel.replaceFirst('66', '0');
    }
    return tel;
  }
}
