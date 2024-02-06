class Portfolio {
  String coinName;
  double quantity;
  double value;
  String imageUrl;

  Portfolio({
    required this.coinName,
    required this.quantity,
    required this.value,
    required this.imageUrl,
  });

  factory Portfolio.fromJson(Map<String, dynamic> json) => Portfolio(
        coinName: json["coin_name"],
        quantity: json["quantity"]?.toDouble(),
        value: json["value"]?.toDouble(),
        imageUrl: json["image_url"] ?? 'assets/Dollar.png',
      );

  Map<String, dynamic> toJson() => {
        "coin_name": coinName,
        "quantity": quantity,
        "value": value,
        "image_url": imageUrl,
      };
}
