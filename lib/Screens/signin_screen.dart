import 'package:flutter/material.dart';
import 'package:logginapplication/utils/color_utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.pinkAccent,
            Colors.deepPurple,
            Colors.blue,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter ),
        ),
      ),
    );
  }
}
