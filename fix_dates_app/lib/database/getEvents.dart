import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetEvents {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;
  var groupName = "MAD";
  List<Map<String, dynamic>> events = [];

  StreamSubscription<QuerySnapshot>? eventsSubscription;

  void getEvents() {
    eventsSubscription = db
        .collection("group")
        .doc(groupName)
        .collection("events")
        .snapshots()
        .listen((QuerySnapshot querySnapshot) {
      // Clear the events list before updating it
      events.clear();

      // Loop through each document and retrieve its data
      querySnapshot.docs.forEach((doc) {
        // Add document data to the events list
        print(doc.data());
        events.add(doc.data() as Map<String, dynamic>);
      });

      print(events);
    }, onError: (e) => print("Error listening to events: $e"));
  }
}
