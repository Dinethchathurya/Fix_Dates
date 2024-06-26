import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Vote {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  // Vote method to update the vote in the Firestore database
  Future<void> vote(String groupName, String eventId, int optionIndex) async {
    String selection = "option_${optionIndex + 1}";

    DocumentReference eventRef =
        db.collection("group").doc(groupName).collection('events').doc(eventId);

    // Update the vote count for the selected option
    await eventRef.update({
      'options.$selection.votes': FieldValue.increment(1),
      'options.$selection.votedUsers':
          FieldValue.arrayUnion([auth.currentUser?.uid])
    }).then((_) {
      print("Vote added successfully");
    }).catchError((error) {
      print("Error adding vote: $error");
    });
  }

  // Get the event details by eventId
  Future<Map<String, dynamic>?> getEventDetails(
      String groupName, String eventId) async {
    DocumentSnapshot eventSnapshot = await db
        .collection("group")
        .doc(groupName)
        .collection('events')
        .doc(eventId)
        .get();

    if (eventSnapshot.exists) {
      return eventSnapshot.data() as Map<String, dynamic>?;
    } else {
      return null;
    }
  }

  updateUserVotes(groupName, docId, option) {
    DocumentReference memberRef =
        db.collection("group").doc(groupName).collection('events').doc(docId);
    memberRef.update({
      option: FieldValue.arrayUnion([auth.currentUser?.uid])
    }).then((_) {
      print("vote added successfully");
    }).catchError((error) {
      print("Error adding vote");
    });
  }
}
