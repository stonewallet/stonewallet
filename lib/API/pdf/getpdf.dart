import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stone_wallet_main/API/shared_preferences.dart';
import 'package:stone_wallet_main/UI/Constants/urls.dart';
import 'package:stone_wallet_main/UI/Model/Getpdf/getpdf_model.dart';

class ApiForGetPdf {
  Future<GetPdf> fetchPdfData(int id) async {
    final Dio dio = Dio();

    try {
      final response = await dio.post(
        "$getPdf/$id/",
        options: Options(headers: {
          "Cookie":
              "csrftoken=${MySharedPreferences().getCsrfToken(await SharedPreferences.getInstance())}; sessionid=${MySharedPreferences().getSessionId(await SharedPreferences.getInstance())}",
          "X-CSRFToken": MySharedPreferences()
              .getCsrfToken(await SharedPreferences.getInstance())
        }),
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        return GetPdf.fromJson(responseData);
      } else {
        throw Exception('Failed to load PDF data');
      }
    } catch (error) {
      throw Exception('Failed to load PDF data: $error');
    }
  }
}
