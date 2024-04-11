import 'package:flutter/material.dart';

class CreateAnEvent extends StatelessWidget {
  const CreateAnEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
  child: Container(
    margin: EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Create An Event',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  ),
),
    );
  }
}
