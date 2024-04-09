import 'package:fix_dates_app/Screens/LoginAndRegistrationScreens/CreateAnAccount.dart';
import 'package:fix_dates_app/Screens/LoginAndRegistrationScreens/LogInYourAccount.dart';
import 'package:flutter/material.dart';

class ToggleLoginRegister extends StatefulWidget {
  const ToggleLoginRegister({super.key});

  @override
  State<ToggleLoginRegister> createState() => _ToggleLoginRegisterState();
}

class _ToggleLoginRegisterState extends State<ToggleLoginRegister> {

//show login

bool showLoginPage = true;

//toggle
void togglePages() {
  setState(() {
    showLoginPage = !showLoginPage;
  });
}

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LogInYourAccount(
        onTap: togglePages,
      );
    } else {
      return CreateAnAccount(
        onTap: togglePages,
      );
    }
  }
}