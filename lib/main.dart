import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:magnets/routing/app_router.dart';

Future<void> main() async {
  await dotenv.load();
  // does not do anything at the moment
  final String baseUrl = dotenv.env['API_URL'] ?? 'https://jsonplaceholder.typicode.com';

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
