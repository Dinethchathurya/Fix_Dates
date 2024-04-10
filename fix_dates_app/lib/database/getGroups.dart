import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetUsersGroups {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;
  var user = "buthsara@gmail.com";
  List<dynamic> groups = [];

  getGroups() async {
    final docRef = db.collection("tempUsersTable").doc(user);
    await docRef.get().then(
      (DocumentSnapshot doc) {
        groups.addAll(doc['groups']);
      },
      onError: (e) => print("Error getting document: $e"),
    );

    print(groups);
  }
}
