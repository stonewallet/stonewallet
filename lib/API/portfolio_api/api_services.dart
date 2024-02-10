import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stone_wallet_main/API/shared_preferences.dart';
import 'package:stone_wallet_main/UI/Constants/urls.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/portfolio_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Portfolio>> getData() async {
    try {
      final response = await _dio.get(
        portfolio,
        options: Options(headers: {
          "Cookie":
              "csrftoken=${MySharedPreferences().getCsrfToken(await SharedPreferences.getInstance())}; sessionid=${MySharedPreferences().getSessionId(await SharedPreferences.getInstance())}",
          "X-CSRFToken": MySharedPreferences()
              .getCsrfToken(await SharedPreferences.getInstance())
        }),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;

        final filteredData =
            data.where((item) => item['sub_cat'] == 0).toList();
        return filteredData.map((item) => Portfolio.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Portfolio>> getData1() async {
    try {
      final response = await _dio.get(
        portfolio,
        options: Options(headers: {
          "Cookie":
              "csrftoken=${MySharedPreferences().getCsrfToken(await SharedPreferences.getInstance())}; sessionid=${MySharedPreferences().getSessionId(await SharedPreferences.getInstance())}",
          "X-CSRFToken": MySharedPreferences()
              .getCsrfToken(await SharedPreferences.getInstance())
        }),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;

        final filteredData =
            data.where((item) => item['sub_cat'] == 1).toList();
        return filteredData.map((item) => Portfolio.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Portfolio>> getDataForCash() async {
    try {
      final response = await _dio.get(
        portfolio,
        options: Options(headers: {
          "Cookie":
              "csrftoken=${MySharedPreferences().getCsrfToken(await SharedPreferences.getInstance())}; sessionid=${MySharedPreferences().getSessionId(await SharedPreferences.getInstance())}",
          "X-CSRFToken": MySharedPreferences()
              .getCsrfToken(await SharedPreferences.getInstance())
        }),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;

        final filteredData =
            data.where((item) => item['sub_cat'] == 2).toList();
        return filteredData.map((item) => Portfolio.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
