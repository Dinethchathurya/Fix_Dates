// ignore_for_file: unused_import, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:fix_dates_app/components/create&login/checkbox.dart';
import 'package:fix_dates_app/components/create&login/google_button.dart';
import 'package:fix_dates_app/components/create&login/my_button.dart';
import 'package:fix_dates_app/components/create&login/my_textfield.dart';
import 'package:fix_dates_app/components/create&login/passfield.dart';
import 'package:fix_dates_app/Screens/LoginAndRegistrationScreens/LoginYourAccount.dart';
//import 'package:fix_dates_app/Screens/Auth/googleAuth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CreateAnAccount extends StatefulWidget {
  final Function()? onTap;
   CreateAnAccount({super.key, required this.onTap});

  @override
  State<CreateAnAccount> createState() => _CreateAnAccountState();
}

class _CreateAnAccountState extends State<CreateAnAccount> {
   final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  void signUserUp() async {
     //loading effect
    // showDialog(
    //   context: context,
    //    builder: (context) {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //    },);

// sign up

   try {
       if(passwordController.text == confirmpasswordController.text ) {
         await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
      );
     // Navigator.pop(context);
       } else {
        //error
        showErrorMessage("Passwords don't match");
       }
      //loading off
   } on FirebaseAuthException catch (e) {
//loading off
    //Navigator.pop(context);
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
//google
Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

//google Auth

void googlesignup() async {
try{
  await signInWithGoogle();
} catch (e) {
  showErrorMessage("Error");
}
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
       child:  Center(
         child: SingleChildScrollView(
           child: Column(
            children: [
             const SizedBox(height: 80,),
              // logo
           
           Text(
                'Create an Account',
                style: TextStyle(color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold
                ),
                ),
           
              Text(
                'Sign up now to get started with an account.',
                style: TextStyle(color: Colors.grey[800],
                fontSize: 16,
                ),
                ),
           
                const SizedBox(height: 25),
           
                GoogleButton(
                  onTap: googlesignup,
                  buttontext: "Sign up with Google",
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
           
                const SizedBox(height: 15),
           
                Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Text(
                        "Full Name",
                        style: TextStyle(color: Colors.grey[800]),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(bottom: 6),
                         child: Icon
                         (Icons.star_outlined,
                         color: Colors.red,
                         size: 7,
                         ),
                       ),
                     ],
                   ),
                 ),
           
                MyTextField(
                  controller: usernameController,
                  hintText: '',
                  obscureText: false,
                ),
           
                const SizedBox(height: 15),
           
                Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Text(
                        "Email Address",
                        style: TextStyle(color: Colors.grey[800]),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(bottom: 6),
                         child: Icon
                         (Icons.star_outlined,
                         color: Colors.red,
                         size: 7,
                         ),
                       ),
                     ],
                   ),
                 ),
           
                MyTextField(
                  controller: emailController,
                  hintText: '',
                  obscureText: false,
                ),
           
                const SizedBox(height: 15),
           
                Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Text(
                        "Password",
                        style: TextStyle(color: Colors.grey[800]),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(bottom: 6),
                         child: Icon
                         (Icons.star_outlined,
                         color: Colors.red,
                         size: 7,
                         ),
                       ),
                     ],
                   ),
                 ),
           
                PasswordField(
                  controller: passwordController,
                  hintText: '',
                ),
           
                 const SizedBox(height: 15),
           
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Text(
                        "Confirm Password",
                        style: TextStyle(color: Colors.grey[800]),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(bottom: 6),
                         child: Icon
                         (Icons.star_outlined,
                         color: Colors.red,
                         size: 7,
                         ),
                       ),
                     ],
                   ),
                 ),
           
                PasswordField(
                  controller: confirmpasswordController,
                  hintText: '',
                ),
           
                 const SizedBox(height: 5),
           
           
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkboxx(),
           
                      Text(
                      'I have read and agree to the',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.blue.shade500
                            ),
                          ),
                      ),
                      child:  Text(
                        'Terms of Service',
                        style: TextStyle(
                          color: Colors.blue.shade500,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    ],
                  ),
                ),
           
           
           
                 const SizedBox(height: 5),
           
                 MyButton(
                  onTap: signUserUp,
                  buttontext: "Get Started",
                 ),
           
                 const SizedBox(height: 35),
           
                // or continue with
           
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(width: 4),
                     GestureDetector(
                      onTap: widget.onTap,
                       child: Text(
                        'Log in',
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
