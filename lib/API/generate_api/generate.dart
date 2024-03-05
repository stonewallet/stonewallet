import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stone_wallet_main/API/shared_preferences.dart';
import 'package:stone_wallet_main/UI/Constants/urls.dart';
import 'package:stone_wallet_main/UI/Model/keyFile/key_model.dart';

class ApiForGetKey {
  Future<GetKeyUrl> fetchPdfData({String? name}) async {
    final Dio dio = Dio();

    try {
      final Map<String, dynamic> requestData = {};
      if (name != null && name.isNotEmpty) {
        requestData['mnemonic'] = name;
      }
      final response = await dio.post(
        keyUrl,
        data: requestData.isEmpty ? null : requestData,
        options: Options(
          headers: {
            "Cookie":
                "csrftoken=${MySharedPreferences().getCsrfToken(await SharedPreferences.getInstance())}; sessionid=${MySharedPreferences().getSessionId(await SharedPreferences.getInstance())}",
            "X-CSRFToken": MySharedPreferences()
                .getCsrfToken(await SharedPreferences.getInstance())
          },
          sendTimeout: const Duration(seconds: 1),
          receiveTimeout: const Duration(seconds: 30 * 1000),
        ),
      );
      if (response.statusCode == 200) {
        final responseData = response.data;
        print(responseData);

        GetKeyUrl travelPostResponse =
            GetKeyUrl.fromJson(json.decode(response.toString()));
        return travelPostResponse;
      } else {
        throw Exception('Failed to load PDF data');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse && e.response != null) {
        // Handle DioError related to bad response
        print(e.message);
        throw Exception(
            "Error: ${e.response!.statusCode} - ${e.response!.statusMessage}");
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        // Handle DioError related to timeout
        throw Exception("Error: Timeout occurred while fetching data");
      } else {
        // Handle other DioErrors
        throw Exception('Error: $e');
      }
    } catch (e) {
      // Handle generic exceptions
      throw Exception('Error: $e');
    }
  }
}
