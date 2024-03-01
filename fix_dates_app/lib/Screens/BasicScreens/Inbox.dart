import 'package:fix_dates_app/components/Index/searchBar.dart';
import 'package:flutter/material.dart';

import '../../components/CreateGroup/GroupList.dart';
import '../../components/Index/events_ListTile_widget.dart';

class Inbox extends StatelessWidget {
  const Inbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Events',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              IndexSearchBar(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final event = events[index];
                      return SizedBox(
                        height: 100, // Specify a fixed height for each tile
                        child: events_ListTile_widget(
                          title: event['title'],
                          subtitle: Text(event['subtitle']),
                          color: event['color'],
                          time: event['time'],
                          imagepath: event['imagePath'],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/CreateGroup');
        },
        shape: CircleBorder(),
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          size: 40.0,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
