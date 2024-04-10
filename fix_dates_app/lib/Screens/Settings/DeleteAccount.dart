import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class DeleteAccount extends StatelessWidget {
  final VoidCallback onDelete;
  final Logger logger = Logger();

  DeleteAccount({Key? key, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete My Account'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning,
              color: Colors.red,
              size: 60,
            ),
            const SizedBox(height: 16),
            const Text(
              'Are you sure you want to delete your Account?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Get the entered email
                String enteredEmail = emailController.text;
                // Call the function to delete the account
                deleteAccount(context, enteredEmail);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(218, 255, 255, 255),
              ),
              child: const Text(
                'Delete My Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deleteAccount(BuildContext context, String email) async {
    try {
      // Get current user
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        // Check if the email provided matches the current user's email
        if (currentUser.email == email) {
          // Delete user from Firebase Authentication
          await currentUser.delete();

          // Delete user data from Firestore
          await FirebaseFirestore.instance
              .collection('users')
              .doc(currentUser.uid)
              .delete();

          logger.i('Account deleted successfully');

          // Call the onDelete callback to perform any additional actions
          onDelete();

          // Navigate back to the previous page
          Navigator.pop(context);
        } else {
          logger.w('Email does not match current user');
        }
      } else {
        logger.w('No user signed in');
      }
    } catch (e) {
      logger.e('Error deleting account: $e');
      // You can show an error message here if needed
    }
  }
}
