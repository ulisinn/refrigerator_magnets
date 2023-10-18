
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:magnets/core/util/getTargetPlaform.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      // running on the web!
    } else {
      // NOT running on the web! You can check for additional platforms here.
    }

    if (defaultTargetPlatform == TargetPlatform.android){
// Android specific code
    }

    dispatchLogin() {
      // header
      final clientOs = getTargetPlatform();
      //payload
      final String baseUrl =
          dotenv.env['HBL_SSO_BASE_URL'] ?? '';
      final String clientId = dotenv.env['HBL_SSO_APP_ID'] ?? '';
      final String userName = dotenv.env['USER_NAME'] ?? '';
      final String passWord = dotenv.env['PASSWORD'] ?? '';
      final String appSecret = dotenv.env['HBL_SSO_APP_SECRET'] ?? '';

      final Map<String, dynamic> payload = {
        'grant_type': 'password',
        'username': userName,
        'client_id': clientId,
        'client_secret': appSecret,
        'password': passWord,
        'locale': 'en-US',
      };
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login Screen',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(onPressed: dispatchLogin, child: const Text('login'))
          ],
        ),
      ),
    );
  }
}
