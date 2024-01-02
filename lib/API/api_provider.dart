
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../Responses/travel_list_response.dart';
import '../UI/Constants/urls.dart';

class ApiProvider {
  late Dio _dio;

  ApiProvider() {
    BaseOptions options =
    BaseOptions(connectTimeout: const Duration(milliseconds: 20000),
        receiveTimeout: const Duration(milliseconds: 20000));
    _dio = Dio(options);
  }


Future<List<TravelList>> processTravel() async {

  try {

    if (kDebugMode) {
      print("api hit travel list");
    }
    Response response = await _dio.get(
        travelListUrl,
    );
    if (kDebugMode) {
      print("travel list ${response.data}");
    }

    if(response.statusCode == 200){
      List res = response.data;
      List<TravelList> travelList = [];

      res.forEach((element) {
        String str = json.encode(element);
        var travel = TravelList.fromJson(json.decode(str));
        travelList.add(travel);
      });
      return travelList;

    }else{
      var jsonData = jsonDecode(response.data);
      if(kDebugMode){
        print(jsonData["error"]);
      }
      return [];
    }


  } catch (error){
    if(kDebugMode){
      print("Error travel list $error");
    }
    rethrow;
  }
}




}