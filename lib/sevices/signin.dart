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
    if (user != null) {
      // Navigate to home screen or other relevant screen
      Navigator.pushNamed(context, '/signup');
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