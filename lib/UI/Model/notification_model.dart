class NotificationModel {
    final int id;
    final DateTime createdAt;
    final bool readMessage;
    final String message;
    final String notificationType;
    final List<MetaDatum> metaData;
    final int user;

    NotificationModel({
        required this.id,
        required this.createdAt,
        required this.readMessage,
        required this.message,
        required this.notificationType,
        required this.metaData,
        required this.user,
    });

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        readMessage: json["read_message"],
        message: json["message"],
        notificationType: json["notification_type"],
        metaData: List<MetaDatum>.from(json["meta_data"].map((x) => MetaDatum.fromJson(x))),
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
        "read_message": readMessage,
        "message": message,
        "notification_type": notificationType,
        "meta_data": List<dynamic>.from(metaData.map((x) => x.toJson())),
        "user": user,
    };
}

class MetaDatum {
    final String tripId;

    MetaDatum({
        required this.tripId,
    });

    factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
        tripId: json["trip_id"],
    );

    Map<String, dynamic> toJson() => {
        "trip_id": tripId,
    };
}
