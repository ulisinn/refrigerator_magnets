import 'package:flutter/foundation.dart';

enum HttpMethod {
  get,
  post,
  put,
  patch,
  delete,
}

class AppRequest {
  AppRequest({required this.url, this.payload, this.method});

  final String url;
  final HttpMethod? method;
  final Map<String, dynamic>? payload;
}
