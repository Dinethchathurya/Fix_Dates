import 'package:flutter/material.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Log Out'),
    ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Perform logout action here
            //Foe example, you can clear user section or navigate to login page
            Navigator.pop(context); // Go back to previous screen
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // background color
            foregroundColor: Colors.white, // Text color
          ),
          child: Text('Log Out'),
        ),
      ),
    );
  }
}

void main(){
  runApp(MaterialApp(
    home: LogOut(),
  ),
  );
}