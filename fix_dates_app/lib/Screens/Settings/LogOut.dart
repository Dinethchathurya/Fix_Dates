import 'package:flutter/material.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock user account details
    String username = "MaxDepp";
    String email = "maxdepp@example.com";
    return Scaffold(
    appBar: AppBar(
      title: Text('Log Out'),
      centerTitle: true, // Center the title
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          // User account details section
          Text(
          'Account Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 8),
        Text('Username: $username'),
        Text('Email: $email'),
        SizedBox(height: 20),
        // Log out button
        ElevatedButton(
          onPressed: () {
      // Show confirmation dialog
      showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('If you log out, you will have to enter your username and password again when logging in.'),
            actions: <Widget>[
            TextButton(
            onPressed: () {
          Navigator.of(context).pop(); // Close the dialog
        },
        child: Text('Cancel'),
        ),
              TextButton(
                onPressed: () {
                  // Perform logout action
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.pop(context);
                //  Navigator.pushNamed(context, '/');
                  // Go back to the previous screen
                },
                child: Text('Log Out'),
              ),
            ],
        );
      },
    );
  },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // background color
            foregroundColor: Colors.white, // Text color
          ),
          child: Text('Log Out'),
        ),
        ],
      ),
      ),
      
    );
  }
}

