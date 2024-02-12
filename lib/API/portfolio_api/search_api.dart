import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stone_wallet_main/API/shared_preferences.dart';

class SearchApi {
  final Dio _dio = Dio();
  Future<List<String>> getSuggestions(String query) async {
    try {
      final response = await _dio.get(
        'https://3.94.82.56/travel/get/prices/',
        queryParameters: {'search': query},
        options: Options(headers: {
          "Cookie":
              "csrftoken=${MySharedPreferences().getCsrfToken(await SharedPreferences.getInstance())}; sessionid=${MySharedPreferences().getSessionId(await SharedPreferences.getInstance())}",
          "X-CSRFToken": MySharedPreferences()
              .getCsrfToken(await SharedPreferences.getInstance())
        }),
      );

      List<String> currencies =
          (response.data as Map<String, dynamic>).keys.toList();

      if (query.isEmpty) {
        return currencies;
      } else {
        return currencies
            .where((currency) =>
                currency.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    } catch (error) {
      throw Exception('Failed to load suggestions');
    }
  }
}
