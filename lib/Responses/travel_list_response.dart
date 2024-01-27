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
  List<Expense> expenses;
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
    expenses: List<Expense>.from(json["expenses"].map((x) => Expense.fromJson(x))),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "trip_name": tripName,
    "product": List<dynamic>.from(product.map((x) => x.toJson())),
    "expenses": List<dynamic>.from(expenses.map((x) => x.toJson())),
    "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
  };
}

class Expense {
  String expenseName;
  int expenseAmount;

  Expense({
    required this.expenseName,
    required this.expenseAmount,
  });

  factory Expense.fromJson(Map<String, dynamic> json) => Expense(
    expenseName: json["expense_name"],
    expenseAmount: json["expense_amount"],
  );

  Map<String, dynamic> toJson() => {
    "expense_name": expenseName,
    "expense_amount": expenseAmount,
  };
}

class Product {
  String productName;
  int quantity;
  int pricePaid;
  int priceSold;
  int totalPricePaid;
  int totalPriceSold;

  Product({
    required this.productName,
    required this.quantity,
    required this.pricePaid,
    required this.priceSold,
    required this.totalPricePaid,
    required this.totalPriceSold,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productName: json["product_name"],
    quantity: json["quantity"],
    pricePaid: json["price_paid"],
    priceSold: json["price_sold"],
    totalPricePaid: json["total_price_paid"],
    totalPriceSold: json["total_price_sold"],
  );

  Map<String, dynamic> toJson() => {
    "product_name": productName,
    "quantity": quantity,
    "price_paid": pricePaid,
    "price_sold": priceSold,
    "total_price_paid": totalPricePaid,
    "total_price_sold": totalPriceSold,
  };
}
