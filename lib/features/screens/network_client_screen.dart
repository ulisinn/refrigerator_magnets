import 'package:flutter/material.dart';
import 'package:magnets/core/networking/app_http_client.dart';
import 'package:magnets/core/networking/app_request.dart';

class NetWorkClientScreen extends StatefulWidget {
  const NetWorkClientScreen({super.key});

  @override
  State<NetWorkClientScreen> createState() => _NetWorkClientScreen();
}

class _NetWorkClientScreen extends State<NetWorkClientScreen> {
  Future<dynamic> makeNetworkCallPost() async {
    final Map<String, dynamic> jsonMap = {
      'userId': 1,
      'id': 1,
      'title': 'Some other title',
      'completed': false,
    };
    final httpClient = AppHttpClient();
    final request = AppRequest(
      url: 'posts',
      payload: jsonMap,
    );
    final response = await httpClient.post(request);
    print('==== POST statusCode: ${response.statusCode}');
    print(response.rawResponse);
  }

  Future<dynamic> makeNetworkCallGet() async {
    final httpClient = AppHttpClient();
    final request = AppRequest(
      url: 'todos/1',
    );
    final response = await httpClient.get(request);
    print('==== GET statusCode: ${response.statusCode}');
    print(response.rawResponse);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    makeNetworkCallGet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Client'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Network Client'),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: makeNetworkCallPost,
                child: Text('makeNetworkCallPost'))
          ],
        ),
      ),
    );
  }
}
