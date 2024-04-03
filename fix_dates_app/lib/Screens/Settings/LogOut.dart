import 'package:flutter/material.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Log Out'),
      centerTitle: true, // Center the title
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
        ElevatedButton(
          onPressed: () {
        //Perform delete account action here
        //For example, you can show a confirmation dialog
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, // background color for delete account button
        foregroundColor: Colors.white, // Text color for delete account button
      ),
      child: Text('Delete Account'),
    ),
    SizedBox(height: 20), // Add some space between buttons
    ElevatedButton(
    onPressed: () {
    // Perform logout action here
    // For example, you can clear user session or navigate to login page
    Navigator.pop(context); // Go back to the previous screen
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

void main() {
  runApp(MaterialApp(
    home: LogOut(),
  ),
  );
}