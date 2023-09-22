import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logginapplication/Screens/forgot_password_screen.dart';
import 'package:logginapplication/Screens/loggedin_screen.dart';
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
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.white,
            Colors.black38,
            Colors.black54,
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
                  reUseTextField("Enter the password", Icons.lock_outlined,
                      true, _passwordTextController),
                  signUpOrForgotPassword(false),
                  const SizedBox(
                    height: 40,
                  ),
                  signInSignUpButton(context, true, () async {
                    showDialog(
                        context: context,
                        builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ));
                    await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      print("Login Successfully");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    }).onError((error, stackTrace) {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text(
                                  "Error",
                                  style: TextStyle(color: Colors.red),
                                ),
                                content:
                                    const Text("Invalid username or password"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("CANCEL")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("OK")),
                                ],
                              ));
                      print("Error - ${error.toString()}");
                    });
                    // Navigator.pop(context);
                  }),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  signUpOrForgotPassword(true),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOrForgotPassword(bool isSignUp) {
    return Row(
      mainAxisAlignment:
          isSignUp == true ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Text(
          isSignUp == true ? "Don't have account?" : "Forgot password?",
          style: const TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => isSignUp == true
                        ? const SignUpScreen()
                        : const ForgotPasswordScreen()));
          },
          child: Text(
            isSignUp == true ? " Sign up" : " Reset password",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
