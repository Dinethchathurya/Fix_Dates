import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DeleteUser {
  var db = FirebaseFirestore.instance;

  void deleteUser() async {
    String userID = "uY97vO52bzLZmivOqWTQ";

    try {
      await FirebaseAuth.instance.currentUser?.delete();
      await FirebaseFirestore.instance.collection('users').doc(userID).delete();

      print('User deleted successfully');
    } catch (e) {
      print('Failed to delete user: $e');
    }
  }
}
