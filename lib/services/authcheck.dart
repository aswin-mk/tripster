import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tripster/pages/createprofile_page.dart';
import 'package:tripster/pages/home_page.dart';
import 'package:tripster/pages/login_page.dart';
import 'package:tripster/services/userexist.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  // final FirebaseAuth auth = FirebaseAuth.instance;
  // final User? user = auth.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (UserExist() == 1) {
              return const HomePage();
            } else {
              return const CreateProfile();
            }
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
