// To parse this JSON data, do
//
//     final travelList = travelListFromJson(jsonString);

import 'dart:convert';

List<TravelList> travelListFromJson(String str) => List<TravelList>.from(json.decode(str).map((x) => TravelList.fromJson(x)));

String travelListToJson(List<TravelList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TravelList {
  int id;
  String name;
  int quantity;
  int pricePaid;
  int priceSold;
  Expenses expenses;
  DateTime createdAt;

  TravelList({
    required this.id,
    required this.name,
    required this.quantity,
    required this.pricePaid,
    required this.priceSold,
    required this.expenses,
    required this.createdAt,
  });

  factory TravelList.fromJson(Map<String, dynamic> json) => TravelList(
    id: json["id"],
    name: json["name"],
    quantity: json["quantity"],
    pricePaid: json["price_paid"],
    priceSold: json["price_sold"],
    expenses: Expenses.fromJson(json["expenses"]),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "quantity": quantity,
    "price_paid": pricePaid,
    "price_sold": priceSold,
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
