
class GetPdf {
    String url;

    GetPdf({
        required this.url,
    });

    factory GetPdf.fromJson(Map<String, dynamic> json) => GetPdf(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}
