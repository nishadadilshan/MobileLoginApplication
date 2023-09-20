import 'package:flutter/material.dart';
import 'package:logginapplication/utils/color_utils.dart';

import '../utils/logo_utils.dart';

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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.green,
            Colors.teal,
            Colors.deepPurple,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB((20), MediaQuery.of(context).size.height * 0.2, 20, 0
            ),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/img.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
