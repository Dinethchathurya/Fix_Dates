import 'package:flutter/material.dart';

class CreateAnEvent extends StatefulWidget {
  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateAnEvent> {
  TextEditingController eventNameController = TextEditingController();
  TextEditingController addUsersController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController themeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: eventNameController,
              decoration: InputDecoration(
                labelText: 'Event Name',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: addUsersController,
              decoration: InputDecoration(
                labelText: 'Add Users (comma-separated)',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: dateController,
              decoration: InputDecoration(
                labelText: 'Date (YYYY-MM-DD)',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: themeController,
              decoration: InputDecoration(
                labelText: 'Theme',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _createEvent();
              },
              child: Text('Create Event'),
            ),
          ],
        ),
      ),
    );
  }

  void _createEvent() {
    String eventName = eventNameController.text;
    String addUsers = addUsersController.text;
    String date = dateController.text;
    String theme = themeController.text;
    List<String> users =
        addUsers.split(',').map((user) => user.trim()).toList();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Event Created'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Event Name: $eventName'),
              Text('Date: $date'),
              Text('Theme: $theme'),
              Text('Users Added: ${users.join(", ")}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    eventNameController.dispose();
    addUsersController.dispose();
    dateController.dispose();
    themeController.dispose();
    super.dispose();
  }
}
