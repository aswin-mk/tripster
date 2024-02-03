// main.dart
import 'package:flutter/material.dart';
import 'package:tripster/pages/home_page.dart';
import 'package:tripster/services/authcheck.dart';
import 'pages/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // This is important
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Tripster';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const AuthCheck(),
      routes: {
        '/signup': (context) => const SignupPage(),
        '/homepage':(context) => const HomePage(),
      },
    );
  }
}
