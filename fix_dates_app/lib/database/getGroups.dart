import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class GetUsersGroups {
//   var db = FirebaseFirestore.instance;
//   var auth = FirebaseAuth.instance;
//   var user = "buthsara@gmail.com";
//   List<dynamic> groups = [];

//  StreamSubscription<DocumentSnapshot>? groupsSubscription;
//
//   Stream<List<dynamic>> getGroups() {
//     final docRef = db.collection("tempUsersTable").doc(user);
//     return docRef.snapshots().map((doc) => List.from(doc['groups']));
//   }
// }

class GetUsersGroups {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;
  var user = FirebaseAuth.instance.currentUser?.uid; // Get current user's email
  List<dynamic> groups = [];

  Stream<List<dynamic>> getGroups() {
    if (user == null) {
      // Return an empty stream if user is not authenticated
      return Stream.empty();
    } else {
      final docRef = db.collection("users").doc(user);
      return docRef.snapshots().map((doc) => List.from(doc['groups'] ??
          [])); // Provide a default empty list if 'groups' field doesn't exist
    }
  }
}
