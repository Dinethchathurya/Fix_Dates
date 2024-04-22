import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetEvents {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;
  List<Map<String, dynamic>> events = [];

  StreamSubscription<QuerySnapshot>? eventsSubscription;

  Stream<List<Map<String, dynamic>>> getEvents(String groupName) {
    return db
        .collection("group")
        .doc(groupName)
        .collection("events")
        .snapshots()
        .map((querySnapshot) {
      // Map each document to a map containing document ID and data
      return querySnapshot.docs.map((doc) {
        var eventData = doc.data() as Map<String, dynamic>;
        eventData['id'] = doc.id; // Add document ID to the map
        return eventData;
      }).toList();
    });
  }
}
