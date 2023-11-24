import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'api_interceptor.dart';

class DioService {
  static Dio getInstance() {
    final dio = Dio(
      BaseOptions(
        baseUrl:
            '${dotenv.env['BASE_URL'] ?? ''}/${dotenv.env['API_KEY'] ?? ''}',
        connectTimeout: 120 * 1000, // 120 seconds
        receiveTimeout: 120 * 1000, // 120 seconds
        sendTimeout: 120 * 1000, // 120 seconds
      ),
    );

    dio.interceptors.add(ApiInterceptor());
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    return dio;
  }
}
