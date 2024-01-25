// To parse this JSON data, do
//
//     final travelList = travelListFromJson(jsonString);

import 'dart:convert';

List<TravelList> travelListFromJson(String str) => List<TravelList>.from(json.decode(str).map((x) => TravelList.fromJson(x)));

String travelListToJson(List<TravelList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TravelList {
  int id;
  String tripName;
  List<Product> product;
  Expenses expenses;
  DateTime createdAt;

  TravelList({
    required this.id,
    required this.tripName,
    required this.product,
    required this.expenses,
    required this.createdAt,
  });

  factory TravelList.fromJson(Map<String, dynamic> json) => TravelList(
    id: json["id"],
    tripName: json["trip_name"],
    product: List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
    expenses: Expenses.fromJson(json["expenses"]),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "trip_name": tripName,
    "product": List<dynamic>.from(product.map((x) => x.toJson())),
    "expenses": expenses.toJson(),
    "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
  };
}

class Expenses {
  int transport;
  int hotel;
  int food;

  Expenses({
    required this.transport,
    required this.hotel,
    required this.food,
  });

  factory Expenses.fromJson(Map<String, dynamic> json) => Expenses(
    transport: json["transport"],
    hotel: json["hotel"],
    food: json["food"],
  );

  Map<String, dynamic> toJson() => {
    "transport": transport,
    "hotel": hotel,
    "food": food,
  };
}

class Product {
  String productName;
  int quantity;
  int pricePaid;
  int priceSold;

  Product({
    required this.productName,
    required this.quantity,
    required this.pricePaid,
    required this.priceSold,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productName: json["product_name"],
    quantity: json["quantity"],
    pricePaid: json["price_paid"],
    priceSold: json["price_sold"],
  );

  Map<String, dynamic> toJson() => {
    "product_name": productName,
    "quantity": quantity,
    "price_paid": pricePaid,
    "price_sold": priceSold,
  };
}
