import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:magnets/core/networking/app_request.dart';
import 'package:magnets/core/networking/app_response.dart';

class AppHttpClient {
  static const String _baseUrl = 'jsonplaceholder.typicode.com';
  final _client = http.Client();

  // GET
  Future<AppResponse> get(AppRequest request) async {
    try {
      final Uri uri = Uri.https(_baseUrl, request.url);
      final http.Response result = await _client.get(uri);
      if (result.statusCode == 200) {
        final toDecodedJson = jsonDecode(result.body);
        return AppResponse.success(
            rawResponse: toDecodedJson as Map<String, dynamic>,
            statusCode: result.statusCode);
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
      final Uri uri = Uri.https(_baseUrl, request.url);
      print('uri: $uri');
      final http.Response result =
          await _client.post(uri, body: jsonEncode(request.payload));
      print('result: ${result.statusCode}');

      if (result.statusCode == 201) {
        final toDecodedJson = jsonDecode(result.body);
        return AppResponse.success(
            rawResponse: toDecodedJson as Map<String, dynamic>,
            statusCode: result.statusCode);
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
      final Uri uri = Uri.https(_baseUrl, request.url);
      http.Response result;

      switch (request.method) {
        case HttpMethod.post:
          result = await _client.post(uri, body: jsonEncode(request.payload));
        case HttpMethod.patch:
          result = await _client.patch(uri, body: jsonEncode(request.payload));
        case HttpMethod.put:
          result = await _client.put(uri, body: jsonEncode(request.payload));
        case HttpMethod.delete:
          result = await _client.delete(uri, body: jsonEncode(request.payload));
        default:
          return AppResponse.failed();
      }

      if (result.statusCode == 201) {
        final toDecodedJson = jsonDecode(result.body);
        return AppResponse.success(
            rawResponse: toDecodedJson as Map<String, dynamic>,
            statusCode: result.statusCode);
      } else {
        return AppResponse.failed();
      }
      return AppResponse.failed();
    } catch (e) {
      print(e);
      return AppResponse.failed();
    }
  }
}
