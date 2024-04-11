//import 'package:fix_dates_app/Screens/Auth/auth_page.dart';
//flutter
import 'package:firebase_core/firebase_core.dart';
import 'package:fix_dates_app/Screens/Auth/auth_page.dart';
import 'package:flutter/material.dart';

//import Basic Screens
import 'Screens/BasicScreens/CreateAnEvent.dart';
import 'Screens/BasicScreens/CreateGroup.dart';
import 'Screens/BasicScreens/Inbox.dart';
import 'Screens/LoginAndRegistrationScreens/CreateAnAccount.dart';
//import Login And Registration Screens
import 'Screens/LoginAndRegistrationScreens/LogInYourAccount.dart';
//import settings Screens
import 'Screens/Settings/BlockedUsers.dart';
import 'Screens/Settings/DeleteAccount.dart';
import 'Screens/Settings/EditProfile.dart';
import 'Screens/Settings/LogOut.dart';
import 'Screens/Settings/PrivacyPolicy.dart';
import 'Screens/Settings/Settings.dart';
import 'Screens/Settings/TermsAndCondition.dart';
import 'database/getGroups.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: LogInYourAccount(),
      initialRoute: '/AuthPage',

      routes: {
        //basic routes
        '/': (context) => Inbox(),
        '/CreateGroup': (context) => CreateGroup(),
        '/CreateAnEvent': (context) => CreateAnEvent(),
        //login and registrations routes
        '/AuthPage' : (context) => AuthPage(),
        '/LogInYourAccount': (context) => LogInYourAccount(
              onTap: () {},
            ),
        '/CreateAnAccount': (context) => CreateAnAccount(
              onTap: () {},
            ),
        //settings and settings features routes
        '/Settings': (context) => Settings(),
        '/EditProfile': (context) => EditProfile(),
        '/BlockedUsers': (context) => BlockedUsers(),
        '/DeleteAccount': (context) => DeleteAccount(
              onDelete: () {},
            ),
        '/PrivacyPolicy': (context) => PrivacyPolicy(),
        '/TermsAndCondition': (context) => TermsAndCondition(),
        '/LogOut': (context) => LogOut(),
        '/test': (context) => Database(),
      },
    );
  }
}

class Database extends StatelessWidget {
  const Database({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          // GetEvents getEvents = GetEvents();
          // getEvents.getEvents();

          GetUsersGroups getUsersGroups = GetUsersGroups();
          getUsersGroups.getGroups();

          // CreateEvent createEvent = CreateEvent();
          // createEvent.createEvent();

          // CreateNewGroup createNewGroup = CreateNewGroup();
          // createNewGroup.createGroup();
        },
        child: Text('CLICK'),
      ),
    );
  }
}
