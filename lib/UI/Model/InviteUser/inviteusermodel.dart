
class InviteUserModel {
    final int id;
    final String username;

    InviteUserModel({
        required this.id,
        required this.username,
    });

    factory InviteUserModel.fromJson(Map<String, dynamic> json) => InviteUserModel(
        id: json["id"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
    };
}
