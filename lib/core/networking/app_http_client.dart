import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:magnets/core/networking/app_request.dart';
import 'package:magnets/core/networking/app_response.dart';

class AppHttpClient {
  static const String _baseUrl = 'jsonplaceholder.typicode.com';
  final _client = http.Client();

  Future<AppResponse> get(AppRequest request) async {
    try {
      final Uri uri = Uri.https(_baseUrl, request.url);
      final http.Response result = await _client.get(uri);
      print(result.statusCode);
      if (result.statusCode == 200) {
        final toDecodedJson = jsonDecode(result.body);
        return AppResponse.success(
            rawResponse: toDecodedJson as Map<String, dynamic>);
      } else {
        return AppResponse.failed();
      }
    } catch (e) {
      print('error: $e');
      return AppResponse.failed();
    }
  }
}
