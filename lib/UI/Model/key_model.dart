class KeyModel{
  String privateKey;
  String publicKey;

  KeyModel({
    required this.privateKey,
    required this.publicKey,
  }) ;

  factory KeyModel.fromJson(Map<String, dynamic> json){
    return KeyModel(
      privateKey: json['privateKey'],
      publicKey: json['publicKey'],
    );
  }

}