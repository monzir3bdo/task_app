import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:task_management/core/contants/constants.dart';

const String applicationJson = 'application/json';
const String contentType = 'content-Type';
const String accept = 'accept';
const String authorization = 'authorization';
const String defaultLanguage = 'language';

class DioFactory {
  DioFactory();

  Future<Dio> getDio() async {
    Dio dio = Dio();

    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
    };
    dio.options = BaseOptions(
      headers: headers,
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(milliseconds: 6000),
      receiveTimeout: const Duration(milliseconds: 6000),
    );
    if (kReleaseMode) {
      print('Release mode no logs');
    } else {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ));
    }
    return dio;
  }
}
