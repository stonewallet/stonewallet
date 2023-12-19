class PortfolioModel{
  String name;
  String image;
  String amount;

  PortfolioModel({
    required this.name,
    required this.image,
    required this.amount,
  }) ;

  factory PortfolioModel.fromJson(Map<String, dynamic> json){
    return PortfolioModel(
      name: json['name'],
      image: json['image'],
      amount: json['amount'],
    );
  }

}