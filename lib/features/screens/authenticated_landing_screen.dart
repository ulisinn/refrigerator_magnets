import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Landing Screen'),),
      body:  Center(
        child: Column(
          children: [
            Image.asset('comp_for_poc.jpg'),
            const Text('AuthenticatedLanding Screen'),
          ],
        ),
      ),
    );
  }
}
