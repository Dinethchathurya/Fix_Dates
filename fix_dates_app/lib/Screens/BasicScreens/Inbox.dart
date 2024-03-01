import 'package:flutter/material.dart';

class Inbox extends StatelessWidget {
  const Inbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Events'),
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                border: OutlineInputBorder().copyWith(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                // hintText: 'Enter a search term',
              ),
            )
          ],
        ),
      ),
    );
  }
}
