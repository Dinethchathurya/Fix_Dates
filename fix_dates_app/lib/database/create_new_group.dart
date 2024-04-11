import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateNewGroup {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  // Method to create a new group
  void createGroup(String groupName, List<String> members) {
    final groupDetails = <String, dynamic>{
      "created by": auth.currentUser!.email,
      "members": members,
    };

    db
        .collection("group")
        .doc(groupName)
        .set(groupDetails)
        .then((_) {
          print("Group created successfully.");
        })
        .catchError((error) {
          print("Error creating group: $error");
        });

    for (var member in members) {
      DocumentReference memberRef = db.collection("users").doc(member);
      memberRef.update({
        "groups": FieldValue.arrayUnion([groupName])
      }).then((_) {
        print("Group added successfully for $member");
      }).catchError((error) {
        print("Error adding group for $member: $error");
      });
    }
  }
}
