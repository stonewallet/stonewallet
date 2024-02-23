import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stone_wallet_main/API/shared_preferences.dart';
import 'package:stone_wallet_main/Responses/travel_post_response.dart';
import 'package:stone_wallet_main/UI/Constants/urls.dart';

class ApiServiceForLogOut {
  final Dio _dio = Dio();

  Future<TravelPostResponse> logOut() async {
    try {
      if (kDebugMode) {
        print("logout api hit");
      }
      Response response = await _dio.post(
        logOutPost,
        options: Options(headers: {
          "Cookie":
              "csrftoken=${MySharedPreferences().getCsrfToken(await SharedPreferences.getInstance())}; sessionid=${MySharedPreferences().getSessionId(await SharedPreferences.getInstance())}",
          "X-CSRFToken": MySharedPreferences()
              .getCsrfToken(await SharedPreferences.getInstance())
        }),
      );
      if (kDebugMode) {
        print("logout ${response.data}");
      }

      TravelPostResponse travelPostResponse =
          TravelPostResponse.fromJson(json.decode(response.toString()));
      return travelPostResponse;
    } catch (error) {
      if (kDebugMode) {
        print("Error logout list $error");
      }
      rethrow;
    }
  }
}
