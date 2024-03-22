import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stone_wallet_main/API/shared_preferences.dart';
import 'package:stone_wallet_main/Responses/travel_post_response.dart';
import 'package:stone_wallet_main/UI/Constants/strings.dart';
import '../Responses/travel2_response.dart';
import '../Responses/travel_list_response.dart';
import '../Responses/trip_edit_response.dart';
import '../UI/Constants/urls.dart';

class ApiProvider {
  late Dio _dio;
  String? csrfToken;
  String? sessionId;

  // SharedPreferences prefs = await SharedPreferences.getInstance()
  SharedPreferences? sharedPreferences;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  void getSharePrefs() async {
    sharedPreferences = await _prefs;
  }

  ApiProvider() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(milliseconds: 20000),
      receiveTimeout: const Duration(milliseconds: 20000),
      validateStatus: (status) {
        return status! < 500; // Return true for all status codes < 500
      },
    );
    _dio = Dio(options);
  }

  Future<List<TravelList>> processTravel() async {
    try {
      if (kDebugMode) {
        print("api hit travel list");
        print(travelListUrl);
        print(MySharedPreferences()
            .getCsrfToken(await SharedPreferences.getInstance()));
        print(MySharedPreferences()
            .getSessionId(await SharedPreferences.getInstance()));
      }

      Response response = await _dio.get(
        travelListUrl,
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
        print("travel list ${response.data}");
        print("api hit : hit ");
      }

      if (response.statusCode == 200) {
        List res = response.data;
        List<TravelList> travelList = [];

        res.forEach((element) {
          String str = json.encode(element);
          var travel = TravelList.fromJson(json.decode(str));
          travelList.add(travel);
        });
        print("data $travelList");

        return travelList;
      } else {
        var jsonData = jsonDecode(response.data);
        if (kDebugMode) {
          print(jsonData["error"]);
        }
        return [];
      }
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

  Future<TravelPostResponse> processPostTravel(
      String? name,
      String? item,
      int? quantity,
      int? pricePaid,
      int? priceSold,
      int? transport,
      int? hotel,
      int? food) async {
    try {
      if (kDebugMode) {
        print("Post travel api hit");
      }
      final SharedPreferences sharedPref =
          await SharedPreferences.getInstance();
      final String? userName = sharedPref.getString('name');

      Response response = await _dio.post(
        // "https://3.94.82.56/travel/list/",
        travelPostListUrl,
        data: {
          "trip_name": name,
          "product": [
            {
              "product_name": item,
              "quantity": quantity,
              "price_paid": pricePaid,
              "price_sold": priceSold,
              "user": userName,
            }
          ],
          "user": [],
          "user_order": [],
          "expenses": [
            {
              "expense_name": "Transport",
              "expense_amount": transport,
              "user": userName
            },
            {
              "expense_name": "Hotel",
              "expense_amount": hotel,
              "user": userName
            },
            {
              "expense_name": "Food",
              "expense_amount": food,
              "user": userName,
            },
          ]
        },

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
        print("travelPost ${response.data}");
      }

      TravelPostResponse travelPostResponse =
          TravelPostResponse.fromJson(json.decode(response.toString()));
      return travelPostResponse;
    } catch (error) {
      if (kDebugMode) {
        print("Error travel list $error");
      }
      rethrow;
    }
  }

  Future<TravelPostResponse> processAddEvent(
      Map<String, dynamic> addEvents, int id) async {
    try {
      if (kDebugMode) {
        print("put travel api hit");
        print(addEvents);
      }
      Response response = await _dio.put(
        "$travelList2Url/$id/",
        data: addEvents,
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
        print("travelPost ${response.data}");
      }

      TravelPostResponse travelPostResponse =
          TravelPostResponse.fromJson(json.decode(response.toString()));
      return travelPostResponse;
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

  Future<TravelPostResponse> processLogin(
      String userName, String password) async {
    getSharePrefs();
    try {
      if (kDebugMode) {
        print("login travel api hit");
      }
      Response response = await _dio.post(
        travelLoginUrl,
        data: {"username": userName, "password": password},
      );
      if (kDebugMode) {
        print("travelPost ${response.data}");
      }

      if (response.statusCode == 200) {
        List<String> cookies = response.headers.map['set-cookie']!;

        if (cookies.isNotEmpty && cookies.length == 2) {
          String csToken =
              cookies[0].split(';')[0].replaceAll("csrftoken=", "");
          String sessionToken =
              cookies[1].split(';')[0].replaceAll("sessionid=", "");

          // csrfToken = csToken;
          // sessionId = sessionToken;
          MySharedPreferences().setCsrfToken(sharedPreferences!, csToken);
          MySharedPreferences().setSessionId(sharedPreferences!, sessionToken);

          print("csrfToken $csrfToken");
          print("sessionId $sessionId");
          print(MySharedPreferences()
              .getCsrfToken(await SharedPreferences.getInstance()));
        }

        print("cookies $cookies");
      }

      TravelPostResponse travelPostResponse =
          TravelPostResponse.fromJson(json.decode(response.toString()));
      return travelPostResponse;
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

  Future<TravelPostResponse> processRegister(String name, String pass) async {
    try {
      if (kDebugMode) {
        print("Register api hit");
      }
      Response response = await _dio.post(
        travelRegisterUrl,
        data: {"username": name, "password": pass},
      );
      if (kDebugMode) {
        print("travelPost ${response.data}");
      }

      TravelPostResponse travelPostResponse =
          TravelPostResponse.fromJson(json.decode(response.toString()));
      return travelPostResponse;
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

  Future<Travel2Response> processTravel2(int id) async {
    try {
      if (kDebugMode) {
        print("Next travel api hit");
        print("$travelList2Url/$id/");
      }
      Response response = await _dio.get(
        "$travelList2Url/$id/",
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

      Travel2Response travel2response =
          Travel2Response.fromJson(json.decode(response.toString()));
      return travel2response;
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

  Future<TripEditResponse> processTravelPut(
    int id,
    Map<String, dynamic> edit,
    // int id, String? name, int? quantity, int? pricePaid, int? priceSold,
    // int? transport, int? hotel, int? food, String createdAt
  ) async {
    try {
      if (kDebugMode) {
        print("Edit travel api hit");
        print("$travelList2Url/$id/");
      }
      Response response = await _dio.put(
        "$travelList2Url/$id/",
        data: edit,
        // {
        //   "id": id,
        //   "name": name,
        //   "quantity": quantity,
        //   "price_paid": pricePaid,
        //   "price_sold": priceSold,
        //   "expenses": {
        //     "transport": transport,
        //     "hotel": hotel,
        //     "food": food
        //   },
        //   "created_at": createdAt,
        //   // "profit": profit
        // },

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
        print("Travel Edit ${response.data}");
      }

      TripEditResponse tripEditResponse =
          TripEditResponse.fromJson(json.decode(response.toString()));
      return tripEditResponse;
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

  Future<TravelPostResponse> processTravelDelete(int id) async {
    try {
      if (kDebugMode) {
        print("Post travel api hit");
      }
      Response response = await _dio.delete(
        "$travelList2Url/$id/",
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
        print("travelDelete ${response.data}");
      }

      TravelPostResponse travelPostResponse =
          TravelPostResponse.fromJson(json.decode(response.toString()));
      return travelPostResponse;
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

  Future<TravelPostResponse> processAddUser(int? id) async {
    try {
      if (kDebugMode) {
        print("Post travel api hit");
      }
      Response response = await _dio.post(
        addUserUrl,
        data: {"trip_id": id},
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
        print("addUser ${response.data}");
      }

      TravelPostResponse travelPostResponse =
          TravelPostResponse.fromJson(json.decode(response.toString()));
      return travelPostResponse;
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
