import 'dart:convert';
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
        "$searchPortfolio/$portfolio/?search=$query",
        options: Options(headers: {
          "Cookie":
              "csrftoken=${MySharedPreferences().getCsrfToken(await SharedPreferences.getInstance())}; sessionid=${MySharedPreferences().getSessionId(await SharedPreferences.getInstance())}",
          "X-CSRFToken": MySharedPreferences()
              .getCsrfToken(await SharedPreferences.getInstance())
        }),
      );

      List<SearchData> searchDataList = [];
      if (response.statusCode == 200) {
        final List<dynamic> data =
            response.data; // Decode response directly to List<dynamic>
        for (var searchData in data) {
          SearchData searchItem = SearchData.fromJson(searchData);
          searchDataList.add(searchItem);
        }
      }
      return searchDataList;
    } catch (error) {
      throw Exception('Failed to load suggestions$error');
    }
  }
}
