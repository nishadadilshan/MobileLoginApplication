import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logginapplication/Screens/loggedin_screen.dart';
import 'package:logginapplication/reusable_widgets/logo_widget.dart';
import 'package:logginapplication/reusable_widgets/signinloginbutton_widget.dart';
import 'package:logginapplication/reusable_widgets/textFeild_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _addressTextController = TextEditingController();
  final TextEditingController _countryTextController = TextEditingController();
  final TextEditingController _mobileTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: (){
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
              padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
              child: Column(
                children: <Widget>[
                  logoWidget("assets/images/img_1.png"),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("SIGN UP",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  reUseTextField("Enter Name", Icons.person_outline, false,
                      _userNameTextController),
                  const SizedBox(
                    height: 10,
                  ),reUseTextField("Enter email address", Icons.email_outlined, false,
                      _emailTextController),
                  const SizedBox(
                    height: 10,
                  ),
                  reUseTextField("Mobile number", Icons.phone_android_outlined, false,
                      _mobileTextController),
                  const SizedBox(
                    height: 10,
                  ),
                  reUseTextField("Enter password", Icons.lock_outlined, true,
                      _passwordTextController),
                  const SizedBox(
                    height: 10,
                  ),
                  signInSignUpButton(context, false, (){
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                        .then((value) {
                            print("Signed up successfully");
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                    }).onError((error, stackTrace) {
                      print("Error - ${error.toString()}");
                    });
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
