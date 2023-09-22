import 'package:flutter/material.dart';

showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: const  Text("OK"),
    onPressed: () { },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Error"),
    content: const Text("Invalid password or email. Please try again."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}