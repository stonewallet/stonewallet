class Portfolio {
  String coinName;
  double quantity;
  int subCat;
  double value;
  String imageUrl;
  String coinShort;

  Portfolio({
    required this.coinName,
    required this.quantity,
    required this.subCat,
    required this.value,
    required this.imageUrl,
    required this.coinShort,
  });

  factory Portfolio.fromJson(Map<String, dynamic> json) => Portfolio(
        coinName: json["coin_name"] ?? " ",
        quantity: json["quantity"]?.toDouble() ?? 0,
        subCat: json["sub_cat"] ?? 0,
        value: json["value"]?.toDouble() ?? "0",
        imageUrl: json["image_url"] ?? 'assets/Dollar.png',
        coinShort: json["coin_short"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "coin_name": coinName,
        "quantity": quantity,
        "sub_cat": subCat,
        "value": value,
        "image_url": imageUrl,
        "coin_short": coinShort,
      };
}
