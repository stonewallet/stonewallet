class StocksModel{
  String name;
  String description;
  String image;
  String amount;
  String add_minus_amount;

  StocksModel({
    required this.name,
    required this.description,
    required this.image,
    required this.amount,
    required this.add_minus_amount,
  }) ;

  factory StocksModel.fromJson(Map<String, dynamic> json){
    return StocksModel(
      name: json['name'],
      description: json['description'],
      image: json['image'],
      amount: json['amount'],
      add_minus_amount: json['add_minus_amount'],
    );
  }

}