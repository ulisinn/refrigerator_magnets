import 'dart:convert';

import 'package:dio/dio.dart';

import 'app_request.dart';
import 'app_response.dart';

class AppDioClient {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/';
  final Dio _client = Dio(
    BaseOptions(baseUrl: _baseUrl),
  );

  // GET
  Future<AppResponse> get(AppRequest request) async {
    try {
      final Response<dynamic> result = await _client.get(request.url);
      final statusCode = result.statusCode ?? 503;

      // print('result ${result.data.runtimeType}');
      if (statusCode == 200) {
        final Map<String, dynamic> toDecodedJson =
            result.data as Map<String, dynamic>;
        return AppResponse.success(
            rawResponse: toDecodedJson, statusCode: statusCode);
      } else {
        return AppResponse.failed();
      }
    } catch (e) {
      // print('error: $e');
      return AppResponse.failed();
    }
  }

  // POST
  Future<AppResponse> post(AppRequest request) async {
    try {
      final Response<dynamic> result =
          await _client.post(request.url, data: jsonEncode(request.payload));

      final statusCode = result.statusCode ?? 503;
      if (statusCode >= 200 && statusCode < 300) {
        final Map<String, dynamic> toDecodedJson =
            result.data as Map<String, dynamic>;
        return AppResponse.success(
            rawResponse: toDecodedJson, statusCode: statusCode);
      } else {
        return AppResponse.failed();
      }
    } catch (e) {
      print(e);
      return AppResponse.failed();
    }
  }

  // GENERIC SEND UPSTREAM
  Future<AppResponse> send(AppRequest request) async {
    try {
      Response<dynamic> result;

      switch (request.method) {
        case HttpMethod.post:
          result = await _client.post(request.url,
              data: jsonEncode(request.payload));
        case HttpMethod.patch:
          result = await _client.patch(request.url,
              data: jsonEncode(request.payload));
        case HttpMethod.put:
          result =
              await _client.put(request.url, data: jsonEncode(request.payload));
        case HttpMethod.delete:
          result = await _client.delete(request.url);
        default:
          return AppResponse.failed();
      }

      final statusCode = result.statusCode ?? 503;

      if (statusCode >= 200 && statusCode < 300) {
        final Map<String, dynamic> toDecodedJson =
            result.data as Map<String, dynamic>;
        return AppResponse.success(
            rawResponse: toDecodedJson, statusCode: statusCode);
      } else {
        return AppResponse.failed();
      }
    } catch (e) {
      print(e);
      return AppResponse.failed();
    }
  }
}
