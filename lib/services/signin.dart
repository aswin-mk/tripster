// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

void signin(BuildContext context, String email, String password) async {
  try {

    

    final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );



    // Successful sign-in
    User? user = userCredential.user;
    Navigator.pop(context);
    if (user != null) {
      // Navigate to home screen or other relevant screen
      Navigator.pushNamed(context, '/homepage');
    }
  } on FirebaseAuthException catch (e) {
    Navigator.pop(context);
    // Handle sign-in errors
    if (e.code == 'user-not-found') {
      showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Alert"),
        content: Text("User not found"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close"),
          ),
        ],
      );
    },
  );
    } else if (e.code == 'wrong-password') {
      showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Alert"),
        content: Text("Wrong password\nTry again"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close"),
          ),
        ],
      );
    },
  );
    } else {
      showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text("Alert"),
            content: Text("An error occured"),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: Text("Close"))
            ],
          );
      });
    }
  }
}

