class Travel2Response {
  int? id;
  String? name;
  int? quantity;
  int? pricePaid;
  int? priceSold;
  Expenses? expenses;
  String? createdAt;
  int? profit;

  Travel2Response(
      {this.id,
        this.name,
        this.quantity,
        this.pricePaid,
        this.priceSold,
        this.expenses,
        this.createdAt,
        this.profit});

  Travel2Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    pricePaid = json['price_paid'];
    priceSold = json['price_sold'];
    expenses = json['expenses'] != null
        ? new Expenses.fromJson(json['expenses'])
        : null;
    createdAt = json['created_at'];
    profit = json['profit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price_paid'] = this.pricePaid;
    data['price_sold'] = this.priceSold;
    if (this.expenses != null) {
      data['expenses'] = this.expenses!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['profit'] = this.profit;
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
