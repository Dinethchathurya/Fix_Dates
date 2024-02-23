// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fix_dates_app/components/create&login/checkbox.dart';
import 'package:fix_dates_app/components/create&login/google_button.dart';
import 'package:fix_dates_app/components/create&login/my_button.dart';
import 'package:fix_dates_app/components/create&login/my_textfield.dart';
import 'package:fix_dates_app/components/create&login/passfield.dart';
import 'package:fix_dates_app/Screens/LoginAndRegistrationScreens/CreateAnAccount.dart';

class LogInYourAccount extends StatelessWidget {
   LogInYourAccount({super.key});

      // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
       child:  Center(
         child: Column(
          children: [
           const SizedBox(height: 140,),
            // logo

         Text(
              'Log in to your Account',
              style: TextStyle(color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold
              ),
              ),

            Text(
              'Welcome back, please enter your details.',
              style: TextStyle(color: Colors.grey[800],
              fontSize: 16,
              ),
              ),

              const SizedBox(height: 25),

              GoogleButton(
                onTap: signUserIn,
                buttontext: "Continue with Google",
                ),

                const SizedBox(height: 20),

                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.9,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'OR',
                        style: TextStyle(color: Colors.grey[400],
                        fontWeight: FontWeight.w300),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.9,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text(
                      "Email Address",
                      style: TextStyle(color: Colors.grey[800]),
                     ),
                   ],
                 ),
               ),

              MyTextField(
                controller: usernameController,
                hintText: '',
                obscureText: false,
              ),

              const SizedBox(height: 20),

              Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text(
                      "Password",
                      style: TextStyle(color: Colors.grey[800]),
                     ),
                   ],
                 ),
               ),

              PasswordField(
                controller: passwordController,
                hintText: '',
              ),

               const SizedBox(height: 5),

               Padding(
                 padding: const EdgeInsets.only(right: 25, left: 10),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   // ignore: prefer_const_literals_to_create_immutables
                   children: [

                    Checkboxx(),

                    Text("Remember me",
                    style: TextStyle(color: Colors.grey[700]),),

                    SizedBox(width: 115),
                    
                     Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                      
                     ),
                   ],
                 ),
               ),



               const SizedBox(height: 5),

               GestureDetector(
                 child: MyButton(
                  onTap: signUserIn,
                  buttontext: "Log in",
                 ),
               ),

               const SizedBox(height: 35),

              // or continue with

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(width: 4),
                   GestureDetector(
                    onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAnAccount())),
                     child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.blue[600],
                        fontWeight: FontWeight.w500
                      ),
                                       ),
                   ),
                ],
              )
              

          ],
          ),
       ),
      )
    );
  }
}
