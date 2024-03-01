import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<Object> UserExist() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;

  var docid = user!.uid;

  final docRef = FirebaseFirestore.instance.collection('users').doc(docid);

  final docSnapshot = await docRef.get();
  if (docSnapshot.exists) {
    // Document exists
    return 1;
  } else {
    // Document does not exist
    return 0;
  }
}
