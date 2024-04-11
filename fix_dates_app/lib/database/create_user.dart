import 'package:cloud_firestore/cloud_firestore.dart';

class CreateUser {
  var db = FirebaseFirestore.instance;

  Future<void> addUser(String uid, String fullName, String email) async {
    await db.collection('users').doc(uid).set({
      'full_name': fullName, // corrected field name
      'email': email,
    });
  }
}