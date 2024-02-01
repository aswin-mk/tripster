import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void SignUserOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed: SignUserOut, icon: const Icon(Icons.logout))],),
      body: const Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}