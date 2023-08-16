import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../shared_reference/shared_preference.dart';
import 'end_points.dart';

//https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}


class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({required String cityName}) async {
    String url="q=$cityName&appid=${EndPoints.apiKey}";
    dio.options.headers = {
      "Content-Type": "application/json",
    };
    return await dio.get(
      url,
    )
        .catchError((e){
      debugPrint(e);
    });
  }

  static Future<Response> postData(
      {required String url,
        required Map<String, dynamic> data,
        Map<String, dynamic>? query,
        String? token}) async {
    dio.options.headers = {
      "Content-Type": "application/json",
    };
    if (token != null) dio.options.headers["Authorization"] = "Bearer $token";
    return await dio
        .post(
      url,
      queryParameters: query,
      data: data,
    )
        .catchError((e) {
      debugPrint(e);
    });
  }

  static Future<Response> patchData(
      {required String url,
        required Map<String, dynamic> data,
        Map<String, dynamic>? query,
        String? token}) async {
    dio.options.headers = {
      "Content-Type": "application/json",
    };
    return await dio
        .patch(
      url,
      queryParameters: query,
      data: data,
    )
        .catchError((e) {});
  }
}
