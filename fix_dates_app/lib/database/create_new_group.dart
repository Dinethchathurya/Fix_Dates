import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateNewGroup {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  createGroup() {
    String groupName = "MAD";
    List members = ['dineth@gmail.com', 'buthsara@gmail.com'];

    final groupDetails = <String, dynamic>{
      "created by": "dineth@gmail.com",
      "members": members,
    };

    db
        .collection("group")
        .doc(groupName)
        .set(groupDetails)
        .onError((e, _) => print("Error writing document: $e"));

    for (var member in members) {
      DocumentReference memberRef = db.collection("tempUsersTable").doc(member);
      memberRef.update({
        "groups": FieldValue.arrayUnion([groupName])
      }).then((_) {
        print("Group added successfully for ");
      }).catchError((error) {
        print("Error adding group: $error");
      });
    }
  }
}
