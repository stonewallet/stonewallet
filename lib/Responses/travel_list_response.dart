// To parse this JSON data, do
//
//     final travelList = travelListFromJson(jsonString);

import 'dart:convert';

import 'package:stone_wallet_main/Responses/travel2_response.dart';

List<TravelList> travelListFromJson(String str) =>
    List<TravelList>.from(json.decode(str).map((x) => TravelList.fromJson(x)));

String travelListToJson(List<TravelList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TravelList {
  int id;
  String tripName;
  List<Product> product;
  List<Expenses> expenses;
  DateTime createdAt;
  List<int> user;

  TravelList({
    required this.id,
    required this.tripName,
    required this.product,
    required this.expenses,
    required this.createdAt,
    required this.user,
  });

  factory TravelList.fromJson(Map<String, dynamic> json) => TravelList(
        id: json["id"],
        tripName: json["trip_name"],
        product:
            List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
        expenses: List<Expenses>.from(
            json["expenses"].map((x) => Expenses.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
        user: List<int>.from(json["user"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "trip_name": tripName,
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
        "expenses": List<dynamic>.from(expenses.map((x) => x.toJson())),
        "user": List<dynamic>.from(user.map((x) => x)),
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
      };
}

// class Expense {
//   String expenseName;
//   int expenseAmount;
//
//   Expense({
//     required this.expenseName,
//     required this.expenseAmount,
//   });
//
//   factory Expense.fromJson(Map<String, dynamic> json) => Expense(
//     expenseName: json["expense_name"],
//     expenseAmount: json["expense_amount"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "expense_name": expenseName,
//     "expense_amount": expenseAmount,
//   };
// }


