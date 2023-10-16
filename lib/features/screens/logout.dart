import 'package:flutter/material.dart';

class LogOutScreen extends StatelessWidget {
  const LogOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Logout'),),
      body: const Center(
        child: Text('Logout'),
      ),
    );
  }
}
