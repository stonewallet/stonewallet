class TripEditResponse {
  String? message;
  Data? data;

  TripEditResponse({this.message, this.data});

  TripEditResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? tripName;
  List<Product>? product;
  Expenses? expenses;
  String? createdAt;

  Data({this.id, this.tripName, this.product, this.expenses, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripName = json['trip_name'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
    expenses = json['expenses'] != null
        ? new Expenses.fromJson(json['expenses'])
        : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trip_name'] = this.tripName;
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    if (this.expenses != null) {
      data['expenses'] = this.expenses!.toJson();
    }
    data['created_at'] = this.createdAt;
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
      {this.productName,
        this.quantity,
        this.pricePaid,
        this.priceSold,
        this.totalPricePaid,
        this.totalPriceSold});

  Product.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    quantity = json['quantity'];
    pricePaid = json['price_paid'];
    priceSold = json['price_sold'];
    totalPricePaid = json['total_price_paid'];
    totalPriceSold = json['total_price_sold'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['quantity'] = this.quantity;
    data['price_paid'] = this.pricePaid;
    data['price_sold'] = this.priceSold;
    data['total_price_paid'] = this.totalPricePaid;
    data['total_price_sold'] = this.totalPriceSold;
    return data;
  }
}

class Expenses {
  int? transport;
  int? hotel;
  int? food;

  Expenses({this.transport, this.hotel, this.food});

  Expenses.fromJson(Map<String, dynamic> json) {
    transport = json['transport'];
    hotel = json['hotel'];
    food = json['food'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transport'] = this.transport;
    data['hotel'] = this.hotel;
    data['food'] = this.food;
    return data;
  }
}
