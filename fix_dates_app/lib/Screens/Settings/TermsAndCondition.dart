import 'package:flutter/material.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Terms and Conditions',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    // Your terms and conditions text goes here
                    'Welcome to our Event Planning App! By using this application, you agree to comply with and be bound by the following terms and conditions of use.\n\n'
                        '1. Usage:\n'
                        'The use of this application is subject to the following terms of use:\n'
                        '- The content of the pages of this application is for your general information and use only. It is subject to change without notice.\n'
                        '- This application uses cookies to monitor browsing preferences.\n'
                        '- Neither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness, or suitability of the information and materials found or offered on this application for any particular purpose. You acknowledge that such information and materials may contain inaccuracies or errors and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law.\n\n'
                        '2. Privacy Policy:\n'
                        'Your privacy is important to us. Please read our Privacy Policy to understand how we collect, use, and disclose information about you.\n\n'
                        '3. Changes to Terms and Conditions:\n'
                        'We reserve the right to update or modify these terms and conditions at any time without prior notice. Your continued use of the application after any changes constitutes acceptance of the new terms and conditions.\n\n'
                        'If you have any questions about these terms and conditions, please contact us.\n',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Code to handle user agreement
                      Navigator.of(context).pop(true); // Assuming true for agreement
                    },
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    child: Text('Agree',
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Code to handle user disagreement
                  //     Navigator.of(context).pop(false); // Assuming false for disagreement
                  //   },
                  //   style: ButtonStyle(
                  //     backgroundColor:
                  //     MaterialStateProperty.all<Color>(Colors.red),
                  //   ),
                  //   child: Text('Disagree'),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
