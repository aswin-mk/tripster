import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

Future<void> AddUser(String name, String gender, int phone, int age,
    BuildContext context) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var userid = user!.uid;

  Map<String, dynamic> data = {
    "name": name,
    "age": age,
    "phone_no": phone,
    "gender": gender
  };

  DocumentReference docRef = firestore.collection("users").doc(userid);

  await docRef.set(data);

  Navigator.pushNamed(context, '/homepage');
}
