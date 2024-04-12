import 'package:cloud_firestore/cloud_firestore.dart';

class CreateEvent {
  var db = FirebaseFirestore.instance;

  createEvent() {
    String groupName = "MAD";
    String title = "title";
    String description = "description";
    String createdUserid = "dineth@gmail.com";
    DateTime createdDatetime = DateTime.now();
    DateTime closedDatetime = DateTime.now();
    List firstOption = ["dineth@gmail.com", "dineth@gmail.com"];
    List secondOption = ["dineth@gmail.com", "dineth@gmail.com"];
    List thirdOption = ["dineth@gmail.com", "dineth@gmail.com"];
    String date1 = '';
    String date2 = '';
    String date3 = '';

    final eventDetails = <String, dynamic>{
      "title": title,
      "description": description,
      "created_user_id": createdUserid,
      "created_datetime": createdDatetime,
      "cloused_datetime": closedDatetime,
      date1: firstOption,
      date2: secondOption,
      date3: thirdOption,
    };

    db
        .collection("group")
        .doc(groupName)
        .collection("events")
        .doc()
        .set(eventDetails)
        .onError((e, _) => print("Error writing document: $e"));
  }
}
