class Travel2Response {
  int? id;
  String? tripName;
  List<Product>? product;
  List<Expenses>? expenses;
  String? createdAt;
  List<int>? user;
  int? profit;

  Travel2Response({id, tripName, product, expenses, createdAt, user, profit});

  Travel2Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripName = json['trip_name'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
    if (json['expenses'] != null) {
      expenses = <Expenses>[];
      json['expenses'].forEach((v) {
        expenses!.add(Expenses.fromJson(v));
      });
    }
    if (json['user'] != null) {
      user = List<int>.from(json['user']);
    }

    createdAt = json['created_at'];
    profit = json['profit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['trip_name'] = tripName;
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    if (expenses != null) {
      data['expenses'] = expenses!.map((v) => v.toJson()).toList();
    }
    data['user'] = user;
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
  String? user;
  Product({
    productName,
    quantity,
    pricePaid,
    priceSold,
    totalPricePaid,
    totalPriceSold,
    user,
  });

  Product.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    quantity = json['quantity'];
    pricePaid = json['price_paid'];
    priceSold = json['price_sold'];
    totalPricePaid = json['total_price_paid'];
    totalPriceSold = json['total_price_sold'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_name'] = productName;
    data['quantity'] = quantity;
    data['price_paid'] = pricePaid;
    data['price_sold'] = priceSold;
    data['total_price_paid'] = totalPricePaid;
    data['total_price_sold'] = totalPriceSold;
    data['user'] = user;
    return data;
  }
}

class Expenses {
  String? expenseName;
  int? expenseAmount;
  String? user;

  Expenses({
    expenseName,
    expenseAmount,
    user,
  });

  Expenses.fromJson(Map<String, dynamic> json) {
    expenseName = json['expense_name'];
    expenseAmount = json['expense_amount'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expense_name'] = expenseName;
    data['expense_amount'] = expenseAmount;
    data['user'] = user;
    return data;
  }
}
