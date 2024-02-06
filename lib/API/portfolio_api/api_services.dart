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
          "Cookie": "csrftoken=${MySharedPreferences().getCsrfToken(await SharedPreferences.getInstance())}; sessionid=${MySharedPreferences().getSessionId(await SharedPreferences.getInstance())}",
          "X-CSRFToken": MySharedPreferences().getCsrfToken(await SharedPreferences.getInstance())
        }),
      ); 

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((item) => Portfolio.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

