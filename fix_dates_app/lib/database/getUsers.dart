import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class GetUsers {
  var db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getInfoStream() {
    final userlist = db.collection('users').snapshots();
    return userlist;
  }
}
