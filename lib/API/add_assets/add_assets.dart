import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stone_wallet_main/API/shared_preferences.dart';
import 'package:stone_wallet_main/Responses/travel_post_response.dart';
import 'package:stone_wallet_main/UI/Constants/urls.dart';

class ApiServiceForADDAssets {
  final Dio _dio = Dio();

  Future<TravelPostResponse> addAsset(
      String name, double quantity, int subcat) async {
    //   try {
    //     final response = await _dio.post(
    //       'YOUR_API_ENDPOINT_HERE',
    //       data: {
    //         'coin_name': coinName,
    //         'quantity': quantity,
    //       },
    //     );

    //     // Handle response
    //     if (response.statusCode == 200) {
    //       // Request successful, handle the response data
    //       print('Asset added successfully');
    //     } else {
    //       // Request failed, handle error
    //       print('Failed to add asset. Status code: ${response.statusCode}');
    //     }
    //   } catch (e) {
    //     // Handle error
    //     print('Error adding asset: $e');
    //     rethrow; // Rethrow the error to propagate it
    //   }
    // }
    try {
      if (kDebugMode) {
        print("Add Post api hit");
      }
      Response response = await _dio.post(
        createPortfolio,
        data: {"coin_name": name, "quantity": quantity, "sub_cat": subcat},
        options: Options(headers: {
          "Cookie":
              "csrftoken=${MySharedPreferences().getCsrfToken(await SharedPreferences.getInstance())}; sessionid=${MySharedPreferences().getSessionId(await SharedPreferences.getInstance())}",
          "X-CSRFToken": MySharedPreferences()
              .getCsrfToken(await SharedPreferences.getInstance())
        }),
      );
      if (kDebugMode) {
        print("addUser ${response.data}");
      }
      TravelPostResponse travelPostResponse =
          TravelPostResponse.fromJson(json.decode(response.toString()));
      return travelPostResponse;
    } catch (error) {
      if (kDebugMode) {
        print("Error Add User $error");
      }
      rethrow;
    }
  }

  Future<TravelPostResponse> update(
      String name, double quantity, int subcat) async {
    //   try {
    //     final response = await _dio.post(
    //       'YOUR_API_ENDPOINT_HERE',
    //       data: {
    //         'coin_name': coinName,
    //         'quantity': quantity,
    //       },
    //     );

    //     // Handle response
    //     if (response.statusCode == 200) {
    //       // Request successful, handle the response data
    //       print('Asset added successfully');
    //     } else {
    //       // Request failed, handle error
    //       print('Failed to add asset. Status code: ${response.statusCode}');
    //     }
    //   } catch (e) {
    //     // Handle error
    //     print('Error adding asset: $e');
    //     rethrow; // Rethrow the error to propagate it
    //   }
    // }

    try {
      if (kDebugMode) {
        print("Add Post api hit");
      }
      Response response = await _dio.put(
        updatePortfolio,
        data: {"coin_name": name, "quantity": quantity, "sub_cat": subcat},
        options: Options(headers: {
          "Cookie":
              "csrftoken=${MySharedPreferences().getCsrfToken(await SharedPreferences.getInstance())}; sessionid=${MySharedPreferences().getSessionId(await SharedPreferences.getInstance())}",
          "X-CSRFToken": MySharedPreferences()
              .getCsrfToken(await SharedPreferences.getInstance())
        }),
      );
      if (kDebugMode) {
        print("addUser ${response.data}");
      }
      TravelPostResponse travelPostResponse =
          TravelPostResponse.fromJson(json.decode(response.toString()));
      return travelPostResponse;
    } catch (error) {
      if (kDebugMode) {
        print("Error Add User $error");
      }
      rethrow;
    }
  }

  Future<TravelPostResponse> delete(
      String name, double quantity, int subcat) async {
    //   try {
    //     final response = await _dio.post(
    //       'YOUR_API_ENDPOINT_HERE',
    //       data: {
    //         'coin_name': coinName,
    //         'quantity': quantity,
    //       },
    //     );

    //     // Handle response
    //     if (response.statusCode == 200) {
    //       // Request successful, handle the response data
    //       print('Asset added successfully');
    //     } else {
    //       // Request failed, handle error
    //       print('Failed to add asset. Status code: ${response.statusCode}');
    //     }
    //   } catch (e) {
    //     // Handle error
    //     print('Error adding asset: $e');
    //     rethrow; // Rethrow the error to propagate it
    //   }
    // }

    try {
      if (kDebugMode) {
        print("Add Post api hit");
      }
      Response response = await _dio.delete(
        deletePortfolio,
        data: {"coin_name": name, "quantity": quantity, "sub_cat": subcat},
        options: Options(headers: {
          "Cookie":
              "csrftoken=${MySharedPreferences().getCsrfToken(await SharedPreferences.getInstance())}; sessionid=${MySharedPreferences().getSessionId(await SharedPreferences.getInstance())}",
          "X-CSRFToken": MySharedPreferences()
              .getCsrfToken(await SharedPreferences.getInstance())
        }),
      );
      if (kDebugMode) {
        print("addUser ${response.data}");
      }
      TravelPostResponse travelPostResponse =
          TravelPostResponse.fromJson(json.decode(response.toString()));
      return travelPostResponse;
    } catch (error) {
      if (kDebugMode) {
        print("Error Add User $error");
      }
      rethrow;
    }
  }
}
