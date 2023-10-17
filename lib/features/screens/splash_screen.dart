import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magnets/routing/app_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Splash/Home Screen',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              context.go(AppRoute.login.name);
            },
            child: const Text('Go to Login'),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              context.go(AppRoute.createAccount.name);
            },
            child: const Text('Go to Create Account'),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              context.go(AppRoute.logout.name);
            },
            child: const Text('Go to Logout'),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              context.go(AppRoute.landing.name);
            },
            child: const Text('Go to Landing Screen'),
          ),
        ],
      ),
    );
  }
}
