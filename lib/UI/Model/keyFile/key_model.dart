
class GetKeyUrl {
  String? message;

  GetKeyUrl({this.message});

  GetKeyUrl.fromJson(Map<String, dynamic> json) {
    message = json['file_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['file_url'] = message;
    return data;
  }
}