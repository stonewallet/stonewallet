import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stone_wallet_main/API/shared_preferences.dart';
import 'package:stone_wallet_main/UI/Constants/urls.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/search_model.dart';

class SearchApi {
  final Dio _dio = Dio();
  Future<List<SearchData>> getSearchData(String query, int portfolio) async {
    try {
      final response = await _dio.get(
        "$searchPortfolio/$portfolio",
        queryParameters: {'search': query},
        options: Options(headers: {
          "Cookie":
              "csrftoken=${MySharedPreferences().getCsrfToken(await SharedPreferences.getInstance())}; sessionid=${MySharedPreferences().getSessionId(await SharedPreferences.getInstance())}",
          "X-CSRFToken": MySharedPreferences()
              .getCsrfToken(await SharedPreferences.getInstance())
        }),
      );

      List<SearchData> searchDataList = [];
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        if (data.isNotEmpty) {
          searchDataList =
              data.map((entry) => SearchData.fromJson(entry)).toList();
        }
      } else {
        print('error');
      }

      return searchDataList;
    } catch (error) {
      throw Exception('Failed to load suggestions$error');
    }
  }
}
