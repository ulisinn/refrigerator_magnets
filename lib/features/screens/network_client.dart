import 'package:flutter/material.dart';
import 'package:magnets/core/networking/app_http_client.dart';
import 'package:magnets/core/networking/app_request.dart';

class NetWorkClientScreen extends StatefulWidget {
  const NetWorkClientScreen({super.key});

  @override
  State<NetWorkClientScreen> createState() => _NetWorkClientScreen();
}

class _NetWorkClientScreen extends State<NetWorkClientScreen> {
  Future<dynamic> makeNetworkCallGet() async {
    final httpClient = AppHttpClient();
    final request = AppRequest(
      url: 'todos/1',
    );
    final response = await httpClient.get(request);
    print('==== isValid: ${response.isValid}');
    print(response.rawResponse);
  }

  @override
  initState() {
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
      body: const Center(
        child: Text('Network Client'),
      ),
    );
  }
}
