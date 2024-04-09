// ignore_for_file: prefer_const_constructors

//import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fix_dates_app/Screens/Auth/home_test.dart';
import 'package:fix_dates_app/Screens/Auth/toggle_login_register.dart';
//import 'package:fix_dates_app/Screens/BasicScreens/Inbox.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot) {
          //logged in
          if(snapshot.hasData) {
            return HomePage();
          }
          else {
            return ToggleLoginRegister();
          }

          //not logged in
        },
      ),
    );
  }
}