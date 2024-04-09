// ignore_for_file: prefer_const_constructors


//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:fix_dates_app/components/create&login/checkbox.dart';
import 'package:fix_dates_app/components/create&login/google_button.dart';
import 'package:fix_dates_app/components/create&login/my_button.dart';
import 'package:fix_dates_app/components/create&login/my_textfield.dart';
import 'package:fix_dates_app/components/create&login/passfield.dart';

class LogInYourAccount extends StatefulWidget {
  final Function()? onTap;
   LogInYourAccount({super.key, required this.onTap});

  @override
  State<LogInYourAccount> createState() => _LogInYourAccountState();
}

class _LogInYourAccountState extends State<LogInYourAccount> {
      // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    //loading effect
    showDialog(
      context: context,
       builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
       },);

// sign in 

   try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
      );
      //loading off
      Navigator.pop(context);
   } on FirebaseAuthException catch (e) {
//loading off
    Navigator.pop(context);
    //error
    showErrorMessage(e.code);
   }  
  }

  //popup for wrong credentials
  void showErrorMessage(String message) {
    showDialog(
      context: context, 
      builder: (context){
      return  AlertDialog(
        backgroundColor: Colors.red,
        title:Center(
          child:Text(
            message,
      style: TextStyle(color: Colors.white),
      ), 
      ) 
      );
      }
      );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
       child:  Center(
         child: SingleChildScrollView(
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
                  controller: emailController,
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
                      onTap: widget.onTap,
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
       ),
      )
    );

  }
}
