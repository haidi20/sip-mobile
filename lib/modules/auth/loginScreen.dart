import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Login Screen',
      style: TextStyle(
        decoration: TextDecoration.none,
        decorationColor: Colors.blue,
        decorationStyle: TextDecorationStyle.double,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.black,
      ),
    );
  }
}
