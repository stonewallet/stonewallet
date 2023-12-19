class CoinModel{
  String name;
  String type;
  String icon;
  String amount;
  String usdAmount;

  CoinModel({
    required this.name,
    required this.type,
    required this.icon,
    required this.amount,
    required this.usdAmount,
  }) ;

  factory CoinModel.fromJson(Map<String, dynamic> json){
    return CoinModel(
      name: json['name'],
      type: json['type'],
      icon: json['icon'],
      amount: json['amount'],
      usdAmount: json['usdAmount'],
    );
  }

}