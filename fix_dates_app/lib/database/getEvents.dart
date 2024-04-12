import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class GetEvents {
//   var db = FirebaseFirestore.instance;
//   var auth = FirebaseAuth.instance;
//
//   Stream<List<Map<String, dynamic>>> getEvents(String groupName) {
//     return db
//         .collection("group")
//         .doc(groupName)
//         .collection("events")
//         .snapshots()
//         .map((querySnapshot) {
//       // Convert the QuerySnapshot to a List<Map<String, dynamic>>
//       return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
//     });
//   }
// }

// class GetEvents {
//   var db = FirebaseFirestore.instance;
//   var auth = FirebaseAuth.instance;
//   var groupName = "MAD";
//   List<Map<String, dynamic>> events = [];

//   StreamSubscription<QuerySnapshot>? eventsSubscription;

//   void getEvents(String groupName) {
//     eventsSubscription = db
//         .collection("group")
//         .doc(groupName)
//         .collection("events")
//         .snapshots()
//         .listen((QuerySnapshot querySnapshot) {
//       // Clear the events list before updating it
//       events.clear();

//       // Loop through each document and retrieve its data
//       querySnapshot.docs.forEach((doc) {
//         // Add document data to the events list
//         print(doc.data());
//         events.add(doc.data() as Map<String, dynamic>);
//       });

//       print(events);
//     }, onError: (e) => print("Error listening to events: $e"));
//   }
// }

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

// Stream<List<Map<String, dynamic>>> getEvents(String groupName) {
  //   return db
  //       .collection("group")
  //       .doc(groupName)
  //       .collection("events")
  //       .snapshots()
  //       .map((querySnapshot) {
  //     // Clear the events list before updating it
  //     events.clear();
  //
  //     // Loop through each document and retrieve its data
  //     querySnapshot.docs.forEach((doc) {
  //       // Add document data to the events list
  //       events.add(doc.data() as Map<String, dynamic>);
  //     });
  //
  //     // Return the events list
  //     return events;
  //   });
  // }
}
