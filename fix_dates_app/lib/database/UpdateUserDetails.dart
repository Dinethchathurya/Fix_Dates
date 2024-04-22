import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateUserDetails {
  var db = FirebaseFirestore.instance;
  update() {
    String userID = "uY97vO52bzLZmivOqWTQ";

    final userDetails = <String, dynamic>{
      "email": "Los Angeles",
      "full name": "CA",
      "country": "USA"
    };

    db
        .collection("users")
        .doc(userID)
        .set(userDetails)
        .onError((e, _) => print("Error writing document: $e"));
  }
}
