import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logginapplication/Screens/auth_screens/reset_password_screen.dart';
import 'package:logginapplication/reusable_widgets/logo_widget.dart';
import '../../animation_transition/custom_page_router.dart';
import '../../reusable_widgets/textFeild_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      body: Container(
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
                (20), MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/img_2.png"),
                const SizedBox(
                  height: 10,
                ),
                const Text("FORGOT PASSWORD",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    )),
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text(
                    "To change the password please enter the provided email address.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                reUseTextField("Enter email address", Icons.email_outlined,
                    false, _emailTextController),
                const SizedBox(
                  height: 10,
                ),
                ForgotPassworSubmitdButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container ForgotPassworSubmitdButton() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: ElevatedButton(
          onPressed: () {
            print("Submit pressed");
            Navigator.of(context).push(
              CustomPageRoute(
                child: const ResetPasswordScreen(),
                direction: AxisDirection.left,
              ),
            );
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const ResetPasswordScreen()));
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.black26;
                }
                return Colors.white;
              }),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              )),
          child: const Text(
            "Submit",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )),
    );
  }
}
