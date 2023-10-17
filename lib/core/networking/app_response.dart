import 'package:flutter/foundation.dart';

class AppResponse {
  AppResponse.success({required this.rawResponse, this.statusCode}) : isValid = true;

  AppResponse.failed()
      : isValid = false,
        statusCode = null,
        rawResponse = null;

  final int? statusCode;
  final Map<String, dynamic>? rawResponse;
  final bool isValid;
}
