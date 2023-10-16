import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magnets/routing/app_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go(AppRoute.login.name);
              },
              child: Text("Go to Login"),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                context.go(AppRoute.createAccount.name);
              },
              child: Text("Go to Create Account"),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                context.go(AppRoute.logout.name);
              },
              child: Text("Go to Logout"),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                context.go(AppRoute.landing.name);
              },
              child: Text("Go to Landing Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
