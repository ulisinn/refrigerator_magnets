class AppResponse {
  AppResponse.success({required this.rawResponse, this.statusCode}) : isValid = true, error = null;

  AppResponse.failed({this.error})
      : isValid = false,
        statusCode = null,
        rawResponse = null;

  final int? statusCode;
  final Map<String, dynamic>? rawResponse;
  final bool isValid;
  final  dynamic error;
}
