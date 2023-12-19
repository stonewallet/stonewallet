class NotificationModel{
  String time;
  String image;

  NotificationModel({
    required this.time,
    required this.image,
  }) ;

  factory NotificationModel.fromJson(Map<String, dynamic> json){
    return NotificationModel(
      time: json['time'],
      image: json['image'],
    );
  }

}