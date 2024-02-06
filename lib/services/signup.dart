


// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> SignUp(BuildContext context,String email,String password) async {
  try {
    showDialog(
      context: context, 
      builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
    );
    

    // Create a new user with the email and password
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Successful signup
    

    // Handle successful signup (e.g., navigate to home page)
    Navigator.pop(context);
    Navigator.pushNamed(context, '/homepage');

  } on FirebaseAuthException catch (e) {
    Navigator.pop(context);
    if (e.code == 'weak-password') {
      showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Alert"),
        content: Text("Password is too weak"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close"),
          ),
        ],
      );
    },
  );;
    } else if (e.code == 'email-already-in-use') {
      showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        
        title: Text("Alert"),
        content: Text("Email already in use\nPlease try another email"),
        actions: [
          Center(
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Close"),
            ),
          ),
        ],
      );
    },
  );
    } else {
      print('Signup failed with code: ${e.code}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}