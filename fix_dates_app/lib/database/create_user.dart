import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateUser {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  Future<void> addUser(String uid, String fullName, String email) async {
    await db.collection('users').doc(uid).set({
      'full_name': fullName, // corrected field name
      'email': email,
      'Uid': auth.currentUser?.uid,
    });
  }
}
