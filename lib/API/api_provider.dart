
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
      options: Options(
          headers: {
            "Cookie": "csrftoken=MtILB4n01d0tJxqwpTlbM5R9lIZqk2VS; sessionid=pdeq1i0ped8ble8mvk8qyeyvrokid4z2",
            "X-CSRFToken": "MtILB4n01d0tJxqwpTlbM5R9lIZqk2VS"
      }
      ),

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

  Future<TravelPostResponse> processPostTravel(String? name,String? item, int? quantity, int? pricePaid, int? priceSold,
      int? transport, int? hotel, int? food) async {

    try {

      if (kDebugMode) {
        print("Post travel api hit");
      }
      Response response = await _dio.post(
        // "https://3.94.82.56/travel/list/",
        travelPostListUrl,
        data: {
          "trip_name": name,
          "product" : [
            {
            "product_name" : item,
            "quantity": quantity,
            "price_paid": pricePaid,
            "price_sold": priceSold,
          }
          ],
          "expenses": {
            "transport": transport,
            "hotel": hotel,
            "food": food
          }
          },

        options: Options(headers: {
          'Content-Type': 'application/json',
          "Cookie": "csrftoken=MtILB4n01d0tJxqwpTlbM5R9lIZqk2VS; sessionid=pdeq1i0ped8ble8mvk8qyeyvrokid4z2",
          "X-CSRFToken": "MtILB4n01d0tJxqwpTlbM5R9lIZqk2VS"}),
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


  Future<TravelPostResponse> processAddEvent(Map<String, dynamic> addEvents, int id) async {

    try {

      if (kDebugMode) {
        print("Post travel api hit");
        print(addEvents);
      }
      Response response = await _dio.put(
        // "https://3.94.82.56/travel/list/",
        "$travelList2Url/$id/",
        data: addEvents,

        options: Options(headers: {
          'Content-Type': 'application/json',
          "Cookie": "csrftoken=MtILB4n01d0tJxqwpTlbM5R9lIZqk2VS; sessionid=pdeq1i0ped8ble8mvk8qyeyvrokid4z2",
          "X-CSRFToken": "MtILB4n01d0tJxqwpTlbM5R9lIZqk2VS"}),
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


  Future<Travel2Response> processTravel2(int id) async {

    try {

      if (kDebugMode) {
        print("Next travel api hit");
        print("$travelList2Url/$id/");
      }
      Response response = await _dio.get(
        "$travelList2Url/$id/",
        options: Options(headers: {
          "Cookie": "csrftoken=MtILB4n01d0tJxqwpTlbM5R9lIZqk2VS; sessionid=pdeq1i0ped8ble8mvk8qyeyvrokid4z2"
        }),

        // options: Options(headers: {"Authorization": token}),
      );
      if (kDebugMode) {
        print("travel next ${response.data}");
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


  Future<Travel2Response> processTravelPut(int id, String? name, int? quantity, int? pricePaid, int? priceSold,
      int? transport, int? hotel, int? food, String createdAt) async {

    try {

      if (kDebugMode) {
        print("Edit travel api hit");
        print("$travelList2Url/$id/");
      }
      Response response = await _dio.put(
        "$travelList2Url/$id/",
        data: {
          "id": id,
          "name": name,
          "quantity": quantity,
          "price_paid": pricePaid,
          "price_sold": priceSold,
          "expenses": {
            "transport": transport,
            "hotel": hotel,
            "food": food
          },
          "created_at": createdAt,
          // "profit": profit
        },

        options: Options(
            headers: {
          'Content-Type': 'application/json',
          "Cookie": "csrftoken=MtILB4n01d0tJxqwpTlbM5R9lIZqk2VS; sessionid=pdeq1i0ped8ble8mvk8qyeyvrokid4z2",
          "X-CSRFToken": "MtILB4n01d0tJxqwpTlbM5R9lIZqk2VS"
            }
        ),
      );

      if (kDebugMode) {
        print("Travel Edit ${response.data}");
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


  Future<TravelPostResponse> processTravelDelete(int id) async {

    try {

      if (kDebugMode) {
        print("Post travel api hit");
      }
      Response response = await _dio.delete(
        "$travelList2Url/$id/",

        options: Options(
            headers: {
              'Content-Type': 'application/json',
              "Cookie": "csrftoken=MtILB4n01d0tJxqwpTlbM5R9lIZqk2VS; sessionid=pdeq1i0ped8ble8mvk8qyeyvrokid4z2",
              "X-CSRFToken": "MtILB4n01d0tJxqwpTlbM5R9lIZqk2VS"
            }
        ),      );
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

  Future<TravelPostResponse> processAddUser(int? id) async {

    try {

      if (kDebugMode) {
        print("Post travel api hit");
      }
      Response response = await _dio.post(
        addUserUrl,
        data: { "trip_id" : id},
        options: Options(
            headers: {
          "Cookie": "csrftoken=MtILB4n01d0tJxqwpTlbM5R9lIZqk2VS; sessionid=pdeq1i0ped8ble8mvk8qyeyvrokid4z2",
          "X-CSRFToken": "MtILB4n01d0tJxqwpTlbM5R9lIZqk2VS"
        }),
      );
      if (kDebugMode) {
        print("addUser ${response.data}");
      }

      TravelPostResponse travelPostResponse =
      TravelPostResponse.fromJson(json.decode(response.toString()));
      return travelPostResponse;
    } catch (error){
      if(kDebugMode){
        print("Error Add User $error");
      }
      rethrow;
    }
  }



}