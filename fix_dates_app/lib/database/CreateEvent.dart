import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class CreateEvent {
//   var db = FirebaseFirestore.instance;

//   createEvent() {
//     String groupName = "MAD";
//     String title = "title";
//     String description = "description";
//     String createdUserid = "dineth@gmail.com";
//     DateTime createdDatetime = DateTime.now();
//     List Options = ["dineth@gmail.com", "dineth@gmail.com"];
//     // List secondOption = ["dineth@gmail.com", "dineth@gmail.com"];
//     // List thirdOption = ["dineth@gmail.com", "dineth@gmail.com"];
//     // String date1 = '';
//     // String date2 = '';
//     // String date3 = '';

//     final eventDetails = <String, dynamic>{
//       "title": title,
//       "description": description,
//       "created_user_id": createdUserid,
//       "created_datetime": createdDatetime,
//       "options": Options,
//       // date1: firstOption,
//       // date2: secondOption,
//       // date3: thirdOption,
//     };

//     db
//         .collection("group")
//         .doc(groupName)
//         .collection("events")
//         .doc()
//         .set(eventDetails)
//         .onError((e, _) => print("Error writing document: $e"));
//   }
// }

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
