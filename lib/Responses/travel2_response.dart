class Travel2Response {
  int? id;
  String? tripName;
  List<Product>? product;
  Expenses? expenses;
  String? createdAt;
  int? profit;

  Travel2Response(
      {id,
        tripName,
        product,
        expenses,
        createdAt,
        profit});

  Travel2Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripName = json['trip_name'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add( Product.fromJson(v));
      });
    }
    expenses = json['expenses'] != null
        ?  Expenses.fromJson(json['expenses'])
        : null;
    createdAt = json['created_at'];
    profit = json['profit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['trip_name'] = tripName;
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    if (expenses != null) {
      data['expenses'] = expenses!.toJson();
    }
    data['created_at'] = createdAt;
    data['profit'] = profit;
    return data;
  }
}

class Product {
  String? productName;
  int? quantity;
  int? pricePaid;
  int? priceSold;
  int? totalPricePaid;
  int? totalPriceSold;

  Product(
      {productName,
        quantity,
        pricePaid,
        priceSold,
        totalPricePaid,
        totalPriceSold});

  Product.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    quantity = json['quantity'];
    pricePaid = json['price_paid'];
    priceSold = json['price_sold'];
    totalPricePaid = json['total_price_paid'];
    totalPriceSold = json['total_price_sold'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['product_name'] = productName;
    data['quantity'] = quantity;
    data['price_paid'] = pricePaid;
    data['price_sold'] = priceSold;
    data['total_price_paid'] = totalPricePaid;
    data['total_price_sold'] = totalPriceSold;
    return data;
  }
}

class Expenses {
  int? transport;
  int? hotel;
  int? food;

  Expenses({transport, hotel, food});

  Expenses.fromJson(Map<String, dynamic> json) {
    transport = json['transport'];
    hotel = json['hotel'];
    food = json['food'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['transport'] = transport;
    data['hotel'] = hotel;
    data['food'] = food;
    return data;
  }
}
