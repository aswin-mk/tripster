import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tripster/pages/homepage.dart';
import 'package:tripster/pages/login.dart';

class Authcheck extends StatelessWidget {
  const Authcheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return const HomePage();
          }
          else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}