
class Portfolio {
    String coinName;
    double quantity;
    double value;

    Portfolio({
        required this.coinName,
        required this.quantity,
        required this.value,
    });

    factory Portfolio.fromJson(Map<String, dynamic> json) => Portfolio(
        coinName: json["coin_name"],
        quantity: json["quantity"]?.toDouble(),
        value: json["value"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "coin_name": coinName,
        "quantity": quantity,
        "value": value,
    };
}
