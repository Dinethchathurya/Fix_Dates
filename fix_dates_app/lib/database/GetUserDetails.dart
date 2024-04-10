import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetUserData {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  getUserData() {
    final docRef = db.collection("users").doc("user_id_01");
    docRef.get().then(
      (DocumentSnapshot doc) {
        print(doc.data());
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }
}
