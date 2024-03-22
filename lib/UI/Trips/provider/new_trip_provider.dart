import 'package:flutter/material.dart';
import 'package:stone_wallet_main/API/GetNotification/get_notification.dart';
import 'package:stone_wallet_main/Responses/notification_count_response.dart';
import 'package:stone_wallet_main/Responses/travel2_response.dart';

class NewTripProvider extends ChangeNotifier {
  final List<Product> _events = [];
  final List<Map<String, dynamic>> _newData = [];
  int _totalQuantity = 0;
  final List _numbers = [];
  Travel2Response _travel2response = Travel2Response();

  List<Product> get events => _events;
  List<Map<String, dynamic>> get newData => _newData;
  int get totalQuantity => _totalQuantity;
  List get numbers => _numbers;
  Travel2Response get travel2response => _travel2response;

  void setTravelData(Travel2Response travel2response) {
    _travel2response = travel2response;
    _events.clear();
    _events.addAll(travel2response.product!);
    _newData.clear();
    _numbers.clear();
    for (int i = 0; i <= _events.length - 1; i++) {
      _newData.add({
        "Item Name": _events[i].productName,
        "Quantity": _events[i].quantity,
        "Bought": _events[i].pricePaid,
        "Sold": _events[i].priceSold,
        "Colour Code": _events[i].colourCode
      });
      _numbers.add(_events[i].quantity!);
    }
    _totalQuantity = _numbers.reduce((value, element) => value + element);
    notifyListeners();
  }

  NotificationResponse? cartItemCount;
  Future<void> fetchCartItemCount() async {
    try {
      cartItemCount = await ApiServiceForNotification().getCount();
      notifyListeners();
    } catch (e) {
      print('Error fetching cart item count: $e');
    }
  }
}
