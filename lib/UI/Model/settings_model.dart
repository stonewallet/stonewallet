class SettingModel{
  String name;
  String image;

  SettingModel({
    required this.name,
    required this.image,
  }) ;

  factory SettingModel.fromJson(Map<String, dynamic> json){
    return SettingModel(
      name: json['name'],
      image: json['image'],
    );
  }

}