import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logginapplication/Screens/auth_screens/signin_screen.dart';
import 'package:logginapplication/Screens/main_screens/new_screen.dart';
import 'package:logginapplication/animation_transition/custom_page_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              children: [
                const Text(
                  "Home Screen",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                ElevatedButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ));
                      await FirebaseAuth.instance.signOut().then((value) {
                        print("Sign out");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()));
                      }).onError((error, stackTrace) {
                        Navigator.pop(context);
                        print("Error - $error");
                      });
                    },
                    child: const Text(
                      "Log out",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    )),
                ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(
                        CustomPageRoute(
                            child: const NewScreen(),
                          direction: AxisDirection.left,
                        ),
                    );
                  },
                    child: const Text("Animation Screen"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
