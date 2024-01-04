
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:stone_wallet_main/Responses/travel_post_response.dart';
import '../Responses/travel2_response.dart';
import '../Responses/travel_list_response.dart';
import '../UI/Constants/urls.dart';

class ApiProvider {
  late Dio _dio;

  ApiProvider() {
    BaseOptions options =
    BaseOptions(connectTimeout: const Duration(milliseconds: 20000),
        receiveTimeout: const Duration(milliseconds: 20000),
      validateStatus: (status) {
        return status! < 500; // Return true for all status codes < 500
      },
    );
    _dio = Dio(options);
  }


Future<List<TravelList>> processTravel() async {

  try {

    if (kDebugMode) {
      print("api hit travel list");
      print(travelListUrl);
    }

    Response response = await _dio.get(
        travelListUrl,
      options: Options(headers: {"Cookie": "csrftoken=mjC4o6wbH3FHyVpMBwYCXcvvnudRm1UX; sessionid=t8wr4andqnjmtdr7m4b16mqb6m8l9a9s"
        // ,"sessionid" : "t8wr4andqnjmtdr7m4b16mqb6m8l9a9s"
      }),

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

  Future<TravelPostResponse> processPostTravel() async {

    try {

      if (kDebugMode) {
        print("Post travel api hit");
      }
      Response response = await _dio.post(
        travelPostListUrl,
        data: {
          "name": "new1",
          "quantity": 150,
          "price_paid": 100,
          "price_sold": 160,
          "expenses": {
            "transport": 120,
            "hotel": 150,
            "food": 110
          }
          },
        // options: Options(headers: {"Authorization": token}),
      );
      if (kDebugMode) {
        print("travelPost ${response.data}");
      }

      TravelPostResponse travelPostResponse =
      TravelPostResponse.fromJson(json.decode(response.toString()));
      return travelPostResponse;
    } catch (error){
      if(kDebugMode){
        print("Error travel list $error");
      }
      rethrow;
    }
  }


  Future<TravelPostResponse> processLogin() async {

    try {

      if (kDebugMode) {
        print("Post travel api hit");
      }
      Response response = await _dio.post(
        travelLoginUrl,
        data: { "username" : "nitin",  "password" : "1234" },
        // options: Options(headers: {"Authorization": token}),
      );
      if (kDebugMode) {
        print("travelPost ${response.data}");
      }

      TravelPostResponse travelPostResponse =
      TravelPostResponse.fromJson(json.decode(response.toString()));
      return travelPostResponse;
    } catch (error){
      if(kDebugMode){
        print("Error travel list $error");
      }
      rethrow;
    }
  }


  Future<TravelPostResponse> processRegister() async {

    try {

      if (kDebugMode) {
        print("Register api hit");
      }
      Response response = await _dio.post(
        travelRegisterUrl,
        data: { "username" : "nitin",  "password" : "1234" },
        // options: Options(headers: {"Authorization": token}),
      );
      if (kDebugMode) {
        print("travelPost ${response.data}");
      }

      TravelPostResponse travelPostResponse =
      TravelPostResponse.fromJson(json.decode(response.toString()));
      return travelPostResponse;
    } catch (error){
      if(kDebugMode){
        print("Error travel list $error");
      }
      rethrow;
    }
  }


  Future<Travel2Response> processTravel2() async {

    try {

      if (kDebugMode) {
        print("Post travel api hit");
      }
      Response response = await _dio.get(
        travelList2Url,

        // options: Options(headers: {"Authorization": token}),
      );
      if (kDebugMode) {
        print("travelPost ${response.data}");
      }

      Travel2Response travel2response =
      Travel2Response.fromJson(json.decode(response.toString()));
      return travel2response;
    } catch (error){
      if(kDebugMode){
        print("Error travel list $error");
      }
      rethrow;
    }
  }


  Future<Travel2Response> processTravelPut() async {

    try {

      if (kDebugMode) {
        print("Post travel api hit");
      }
      Response response = await _dio.put(
        travelList2Url,
        data: {
          "id": 2,
          "name": "120",
          "quantity": 150,
          "price_paid": 100,
          "price_sold": 160,
          "expenses": {
            "transport": 120,
            "hotel": 150,
            "food": 110
          },
          "created_at": "2023-12-19",
          "profit": -320
        },

        // options: Options(headers: {"Authorization": token}),
      );
      if (kDebugMode) {
        print("travelPost ${response.data}");
      }

      Travel2Response travel2response =
      Travel2Response.fromJson(json.decode(response.toString()));
      return travel2response;
    } catch (error){
      if(kDebugMode){
        print("Error travel list $error");
      }
      rethrow;
    }
  }


  Future<TravelPostResponse> processTravelDelete() async {

    try {

      if (kDebugMode) {
        print("Post travel api hit");
      }
      Response response = await _dio.delete(
        travelList2Url,

        // options: Options(headers: {"Authorization": token}),
      );
      if (kDebugMode) {
        print("travelDelete ${response.data}");
      }

      TravelPostResponse travelPostResponse =
      TravelPostResponse.fromJson(json.decode(response.toString()));
      return travelPostResponse;
    } catch (error){
      if(kDebugMode){
        print("Error travel list $error");
      }
      rethrow;
    }
  }


}