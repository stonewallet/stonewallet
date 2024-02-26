import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stone_wallet_main/API/shared_preferences.dart';
import 'package:stone_wallet_main/UI/Constants/urls.dart';

class ApiServiceForCreateWallet {
  final Dio _dio = Dio();
  Future<WalletResponse> createWallet(String name, String pass) async {
    try {
      if (kDebugMode) {
        print("Create wallet api hit");
      }
      Response response = await _dio.post(
        createwallet,
        data: {"mnemonic": name, "password": pass},
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
      if (kDebugMode) {
        print("travel next ${response.data}");
      }

      // Travel2Response travel2response =
      //     Travel2Response.fromJson(json.decode(response.toString()));
      // return travel2response;
      WalletResponse walletResponse = WalletResponse.fromJson(response.data);
      return walletResponse;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse && e.response != null) {
        // Handle DioError related to bad response
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

class WalletResponse {
  final String mnemonicSeed;

  WalletResponse({required this.mnemonicSeed});

  factory WalletResponse.fromJson(Map<String, dynamic> json) {
    return WalletResponse(
      mnemonicSeed: json['mnemonic_seed'] ?? '',
    );
  }
}
