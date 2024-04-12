import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Vote {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  vote() {
    var gName = 'MAD';
    var eventId = 'ZsJuhBvZu4rHZa3ImH1A';
    var selection = "1date_time";

    DocumentReference memberRef =
        db.collection("group").doc(gName).collection('event').doc(eventId);
    memberRef.update({
      selection: FieldValue.arrayUnion([auth.currentUser?.uid])
    }).then((_) {
      print("Group added successfully for r");
    }).catchError((error) {
      print("Error adding group for : $error");
    });
  }
}
