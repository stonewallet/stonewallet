
class HomeCoin {
    String coinName;
    String imageUrl;
    double coinPrice;

    HomeCoin({
        required this.coinName,
        required this.imageUrl,
        required this.coinPrice,
    });

    factory HomeCoin.fromJson(Map<String, dynamic> json) => HomeCoin(
        coinName: json["coin_name"],
        imageUrl: json["image_url"],
        coinPrice: json["coin_price"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "coin_name": coinName,
        "image_url": imageUrl,
        "coin_price": coinPrice,
    };
}
