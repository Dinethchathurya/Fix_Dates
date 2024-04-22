// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fix_dates_app/Screens/LoginAndRegistrationScreens/LoginYourAccount.dart'; // Import your LoginPage class here

class Logout extends StatelessWidget {
  Logout({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  // signout method
  void signOut(BuildContext context) {
    FirebaseAuth.instance.signOut().then((_) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LogInYourAccount(onTap: () {
            
          },), // Navigate to LoginPage
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logout"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Logged In " + user.email!,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20), // Add some space between the text and the button
            ElevatedButton(
              onPressed: () => signOut(context), // Call the signOut method when pressed
              child: Text("Logout"), // Text for the button
            ),
          ],
        ),
      ),
    );
  }
}
