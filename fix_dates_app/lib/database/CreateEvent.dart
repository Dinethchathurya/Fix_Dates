import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateEvent {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  void createEvent(String groupName, String title, String description,
      DateTime createdDatetime, List<String> options) {
    final eventDetails = <String, dynamic>{
      "title": title,
      "description": description,
      "created_user_id": auth.currentUser?.uid,
      "created_datetime": createdDatetime,
      "options": options,
    };

    db
        .collection("group")
        .doc(groupName)
        .collection("events")
        .add(eventDetails)
        .then((value) => print("Event added successfully"))
        .catchError((error) => print("Failed to add event: $error"));
  }
}
