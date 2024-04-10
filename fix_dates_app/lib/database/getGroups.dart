import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetUsersGroups {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;
  var user = "buthsara@gmail.com";
  List<dynamic> groups = [];

  StreamSubscription<DocumentSnapshot>? groupsSubscription;

  void getGroups() {
    final docRef = db.collection("tempUsersTable").doc(user);
    groupsSubscription = docRef.snapshots().listen((DocumentSnapshot doc) {
      groups.clear(); // Clear the existing groups list
      groups.addAll(doc['groups']); // Add all groups from the document
      print(groups);
    }, onError: (e) => print("Error getting document: $e"));
  }
}
