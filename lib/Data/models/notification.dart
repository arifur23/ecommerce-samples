class Notifications {
  int? id;
  String? title;
  String? body;
  bool? isSeen;
  String? time;

  Notifications({this.id, this.title, this.body, this.isSeen, this.time});

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    isSeen = json['isSeen'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['isSeen'] = isSeen;
    data['time'] = time;
    return data;
  }
}