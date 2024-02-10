class Portfolio {
  String coinName;
  double quantity;
  double value;
  int subCat;
  String imageUrl;

  Portfolio({
    required this.coinName,
    required this.quantity,
    required this.subCat,
    required this.value,
    required this.imageUrl,
  });

  factory Portfolio.fromJson(Map<String, dynamic> json) => Portfolio(
        coinName: json["coin_name"],
        quantity: json["quantity"]?.toDouble(),
        value: json["value"]?.toDouble(),
        subCat: json["sub_cat"],
        imageUrl: json["image_url"] ?? 'assets/Dollar.png',
      );

  Map<String, dynamic> toJson() => {
        "coin_name": coinName,
        "quantity": quantity,
        "value": value,
        "sub_cat": subCat,
        "image_url": imageUrl,
      };
}
