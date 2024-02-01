import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Lazy initialization of user object
  late final User? user = FirebaseAuth.instance.currentUser;
  

  void signUserOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => signUserOut(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Welcome to the Home Page!\nLogged in as ${user?.email ?? 'Guest'}",
        ),
      ),
    );
  }
}
