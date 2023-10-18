import 'package:flutter/foundation.dart';

String getTargetPlatform() {
  String? userAgent;
  if (kIsWeb) {
    userAgent = 'web';
  } else {
    userAgent = defaultTargetPlatform.name;
  }

  return userAgent ?? 'unknown';
}
