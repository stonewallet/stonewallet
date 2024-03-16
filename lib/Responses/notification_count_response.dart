class NotificationResponse {
  int? message;

  NotificationResponse({this.message});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    message = json['unread'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['unread'] = message;
    return data;
  }
}