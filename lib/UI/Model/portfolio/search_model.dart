class SearchData {
  String coinName;
  double value;
  int subCat;

  SearchData({
    required this.coinName,
    required this.value,
    required this.subCat,
  });

  factory SearchData.fromJson(Map<String, dynamic> json) => SearchData(
        coinName: json["coin_name"],
        value: json["value"],
        subCat: json["sub_cat"],
      );

  Map<String, dynamic> toJson() => { 
        "coin_name": coinName,
        "value": value,
        "sub_cat": subCat,
      };
}
