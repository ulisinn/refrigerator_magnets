import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:magnets/routing/app_router.dart';

import 'core/util/getTargetPlaform.dart';

Future<void> main() async {
  await dotenv.load();
  // does not do anything at the moment
  final String baseUrl = dotenv.env['API_URL'] ?? 'https://jsonplaceholder.typicode.com';

  const String refreshToken = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmltYXJ5c2lkIjoiNzU1NjkzMSIsInByb2ZpbGVJZCI6Ijc1NTY5MzEiLCJhcHBJZCI6IjMiLCJhdXRoVG9rZW4iOiJCMjBBQUU3M0VCOEEzRTEzNEJDRDg2NUFBNzU2MzkxRTAzMTc4MDc0RjEwMzEyNEEwNEJCRDRDODE2Mjk4MzJGRDNFRUJCNzc5MDJCNTAxRjk0NDc2MEIxNzQ2OUMzNUUyQUE4M0ExQjQ0Q0NDMzg0M0RFOUIyQ0ZCRTNBRTRCMiIsImFwcFVyaSI6Imh0dHBzOi8vcHJvZmlsZS5oZXJiYWxpZmUuY29tIiwiZGV2aWNlSWQiOiIiLCJ1bmlxdWVfbmFtZSI6ImNoYXZlekBhcHBzLmNvbSIsImlzcyI6Imh0dHBzOi8venVzMnBycy1hY2NvdW50cy5teWhlcmJhbGlmZS5jb20vcHJvZmlsZS8iLCJhdWQiOiJodHRwczovL3Byb2ZpbGUuaGVyYmFsaWZlLmNvbSIsImV4cCI6MTY5ODc2NDg4OSwibmJmIjoxNjk3NTU1MTY5fQ.-3z9GyilgpAkmXkDHZPm18UNaTiRmJOXv_xvDKF8X08';
  final bool refreshTokenExpired = Jwt.isExpired(refreshToken);
  print('refreshToken expired: $refreshTokenExpired');

  const String accessToken = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmltYXJ5c2lkIjoiNzU1NjkzMSIsInByb2ZpbGVJZCI6Ijc1NTY5MzEiLCJhcHBJZCI6IjMiLCJhdXRoVG9rZW4iOiJCMjBBQUU3M0VCOEEzRTEzNEJDRDg2NUFBNzU2MzkxRTAzMTc4MDc0RjEwMzEyNEEwNEJCRDRDODE2Mjk4MzJGRDNFRUJCNzc5MDJCNTAxRjk0NDc2MEIxNzQ2OUMzNUUyQUE4M0ExQjQ0Q0NDMzg0M0RFOUIyQ0ZCRTNBRTRCMiIsImFwcFVyaSI6Imh0dHBzOi8vcHJvZmlsZS5oZXJiYWxpZmUuY29tIiwic3ViIjoiY2hhdmV6QGFwcHMuY29tIiwiaWF0IjoxNjk3NTU1Mjg5LCJ1bmlxdWVfbmFtZSI6ImNoYXZlekBhcHBzLmNvbSIsImlzcyI6Imh0dHBzOi8venVzMnBycy1hY2NvdW50cy5teWhlcmJhbGlmZS5jb20vcHJvZmlsZS8iLCJhdWQiOiJodHRwczovL3Byb2ZpbGUuaGVyYmFsaWZlLmNvbSIsImV4cCI6MTY5NzU1NzA4OSwibmJmIjoxNjk3NTU1MTY5fQ.nPhNBCWMvH1Qt_Art8USmA1rbJWN80KqmHTLhCgrAbI';
  final bool accessTokenExpired = Jwt.isExpired(accessToken);
  final DateTime? expirationDate = Jwt.getExpiryDate(accessToken);

  print('accessTokenExpired expired: $accessTokenExpired, $expirationDate');

  if (expirationDate != null) {
    print('${DateFormat.yMMMd().format(expirationDate)} ${DateFormat.Hm().format(expirationDate)}');
  }


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routerConfig,
    );
  }
}
