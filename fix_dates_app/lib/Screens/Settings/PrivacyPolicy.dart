import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:

      SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Privacy Policy for EventPlanner App\n\n'
                'Last Updated: 06/04/2024\n\n'
                'This privacy policy ("Policy") describes how EventPlanner Inc. ("we", "us", or "our") collects, uses, and shares personal information of users of our mobile application, EventPlanner. Please read this Policy carefully to understand our practices regarding your personal information and how we will treat it.\n\n'
                '1. Information We Collect\n\n'
                'We collect information about you in various ways when you use our EventPlanner App, including:\n'
                '- Information You Provide to Us: This includes personal information you provide when you register for the app, such as your name, email address, phone number, and the events you create or attend.\n'
                '- Information We Get from Your Use of the App: This may include information about your device, including IP address, operating system, browser type, and location information, as well as usage details and event preferences'
                'operating system, browser type, and location information, as well as usage details and event preferences.\n\n'
                '2. How We Use Your Information\n\n'
                'We may use the information we collect from you when you use the EventPlanner App in the following ways:\n'
                '-To provide and improve our services to you.\n'
                '-To personalize your experience and to allow us to deliver the type of content and product offerings in which you are most interested\n'
                '-To administer a contest, promotion, survey, or other site feature.\n'
                '-To send periodic emails regarding your account or other products and services.'
                '[...continued...]\n\n'
                'Contact Us\n'
                'If you have any questions about this privacy policy, please contact us at: dinethchathurya2002@gmail.com',
            style: TextStyle(fontSize: 16,
                color: Colors.black),
          ),
        ),
      ),
    );


  }
}
