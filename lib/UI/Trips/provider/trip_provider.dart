import 'package:flutter/material.dart';
import 'package:stone_wallet_main/API/api_provider.dart';
import 'package:stone_wallet_main/Responses/travel_list_response.dart';

class TripProvider extends ChangeNotifier {
  List<TravelList> _travelList = <TravelList>[];
  

  List<TravelList> get travelList => _travelList;


  Future<void> fetch() async {
    _travelList.clear();
    _travelList = await ApiProvider().processTravel();
    notifyListeners();
  }

  
}
