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

    final eventDetails = <String, dynamic>{
      "title": title,
      "description": description,
      "created_user_id": createdUserid,
      "created_datetime": createdDatetime,
      "cloused_datetime": closedDatetime,
      "1date_time": firstOption,
      "2date_time": secondOption,
      "3date_time": thirdOption,
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
