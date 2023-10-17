import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magnets/core/networking/app_dio_client.dart';
import 'package:magnets/core/networking/app_http_client.dart';
import 'package:magnets/core/networking/app_request.dart';

import '../../routing/app_router.dart';

class NetWorkClientScreen extends StatefulWidget {
  const NetWorkClientScreen({super.key});

  @override
  State<NetWorkClientScreen> createState() => _NetWorkClientScreen();
}

class _NetWorkClientScreen extends State<NetWorkClientScreen> {
  // http package
  Future<dynamic> makeHttpClientCallPost() async {
    final Map<String, dynamic> jsonMap = {
      'userId': 1,
      'id': 1,
      'title': 'Some other title',
      'completed': false,
    };
    final client = AppHttpClient();
    final request = AppRequest(
      url: 'posts',
      payload: jsonMap,
    );
    final response = await client.post(request);
    print('==== POST statusCode: ${response.statusCode}');
    print(response.rawResponse);
  }

  Future<dynamic> makeHttpClientCallGet() async {
    final client = AppHttpClient();
    final request = AppRequest(
      url: 'todos/1',
    );
    final response = await client.get(request);
    print('==== GET statusCode: ${response.statusCode}');
    print(response.rawResponse);
  }

  // Dio package
  Future<dynamic> makeDioClientCallPost() async {
    final Map<String, dynamic> jsonMap = {
      'userId': 1,
      'id': 1,
      'title': 'Some other title',
      'completed': false,
    };
    final client = AppDioClient();
    final request = AppRequest(
      url: 'posts',
      payload: jsonMap,
    );
    final response = await client.post(request);
    print('==== DIO POST statusCode: ${response.statusCode}');
    // print(response.rawResponse);
  }

  Future<dynamic> makeDioClientCallGet() async {
    final client = AppDioClient();
    final request = AppRequest(
      url: 'todos/1',
    );
    final response = await client.get(request);
    print('==== GET statusCode: ${response.statusCode}');
    print(response.rawResponse);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // makeHttpClientCallGet();
    makeDioClientCallGet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Network Client Screen',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Network Client Screen',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: makeDioClientCallPost,
                child: const Text('makeDioClientCallPost')),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  context.go(AppRoute.home.name);
                },
                child: const Text('HOME'))
          ],
        ),
      ),
    );
  }
}
