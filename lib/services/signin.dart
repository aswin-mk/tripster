// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

void signin(BuildContext context, String email, String password) async {
  try {

    showDialog(
      context: context, 
      builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
    );

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
    // Handle sign-in errors
    if (e.code == 'user-not-found') {
      print('No user found with that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    } else {
      print(e.message);
    }
  }
}

