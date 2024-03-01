// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> SignUp(BuildContext context, String email, String password) async {
  try {
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    // Check for username availability

    // final usernameQuerySnapshot = await _firestore

    //   .collection('users')

    //   .where('username', isEqualTo: username)

    //   .get();

    // if (usernameQuerySnapshot.docs.isNotEmpty) {

    //  // Username already exists, show an error message

    //  Navigator.pop(context);

    //  ScaffoldMessenger.of(context).showSnackBar(

    //   const SnackBar(content: Text('Username already taken')),

    //  );

    //  return;

    // }

    // Create user in Firebase Authentication

    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Create user document in Firestore with unique username

    // Handle successful signup (e.g., navigate to home page)

    Navigator.pop(context);

    Navigator.pushNamed(context, '/createprofilepage');
  } on FirebaseAuthException catch (e) {
    Navigator.pop(context);

    if (e.code == 'weak-password') {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Alert"),
            content: const Text("Password is too weak"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Close"),
              ),
            ],
          );
        },
      );
    } else if (e.code == 'email-already-in-use') {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Alert"),
            content:
                const Text("Email already in use\nPlease try another email"),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Close"),
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
    Navigator.pop(context);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Alert"),
            content: const Text("An error occured"),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Close"))
            ],
          );
        });
  }
}
