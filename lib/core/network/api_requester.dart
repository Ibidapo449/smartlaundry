import 'dart:core';

import 'package:dio/dio.dart';
import 'package:iklin/core/constant/network_client.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiRequester {
  ApiRequester({
    required this.dio,
  });
  final Dio dio;

  Future<Response> post({
    required String endpoint,
    String? token,
    required dynamic body,
    String? contentType,
    Map? queryParam,
  }) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    dio.options.headers['Content-Type'] = 'application/json';
    final response = await dio.post(
      Base_URL + endpoint,
      data: body,
      options: Options(
        contentType: contentType,
      ),
    );

    return response;
  }

  Future<Response> getRequest({
    required String endpoint,
    String? token,
    Map<String, dynamic>? queryParam,
    bool cacheRequest = false,
  }) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    dio.options.headers['Content-Type'] = 'application/json';
    final response = dio.get(
      Base_URL + endpoint,
      options: Options(),
    );
    return response;
  }

  Future<Response> put({
    required String endpoint,
    String? baseUrl,
    String? token,
    required dynamic body,
  }) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    final response = dio.put(
      Base_URL + endpoint,
      data: body,
    );
    return response;
  }
}
