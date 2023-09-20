import 'package:flutter/material.dart';
import 'package:logginapplication/Screens/signup_screen.dart';
import 'package:logginapplication/reusable_widgets/signinloginbutton_widget.dart';
import 'package:logginapplication/reusable_widgets/textFeild_widget.dart';
import 'package:logginapplication/utils/color_utils.dart';

import '../reusable_widgets/logo_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

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
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                (20), MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/img.png"),
                const SizedBox(
                  height: 30,
                ),
                reUseTextField("Enter the username", Icons.person_outline,
                    false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reUseTextField("Enter the password", Icons.lock_outlined, false,
                    _passwordTextController),
                const SizedBox(
                  height: 40,
                ),
                signInSignUpButton(context, true, () {
                  print("Sign in pressed");
                }),
                // const SizedBox(
                //   height: 10,
                // ),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have account?",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
