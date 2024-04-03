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
      bottomNavigationBar: BottomAppBar(
        child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: Text(
                  'Security',
              style: TextStyle(color: Colors.indigo), //Set text color to indigo
              ),
              onTap: () {
                // Action for Security button
              },
            ),
            ListTile(
              title: Text(
                  'Feedback',
              style: TextStyle(color: Colors.indigo), //Set text color to indigo
              ),
              onTap: () {
                // Action for Feedback button
              },
            ),
            ListTile(
              title: Text(
                  'Privacy & Policy',
              style: TextStyle(color: Colors.indigo), // Set text color to indigo
              ),
              onTap: () {
                // Action for Privacy & Policy button
              },
            ),
            ListTile(
              title: Text(
                  'Terms of Services',
              style: TextStyle(color: Colors.indigo), //Set text color to indigo
              ),
              onTap: () {
                // Action for Terms of Services button
              },
            ),
          ],
        ),
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