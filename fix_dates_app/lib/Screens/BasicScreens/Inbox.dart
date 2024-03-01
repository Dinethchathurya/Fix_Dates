import 'package:fix_dates_app/components/Index/events_ListTile_widget.dart';
import 'package:fix_dates_app/components/Index/searchBar.dart';
import 'package:flutter/material.dart';

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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        events_ListTile_widget(),
                        events_ListTile_widget(),
                        events_ListTile_widget(),
                        events_ListTile_widget(),
                        events_ListTile_widget(),
                        events_ListTile_widget(),
                        events_ListTile_widget(),
                        events_ListTile_widget(),
                        events_ListTile_widget(),
                        events_ListTile_widget(),
                        events_ListTile_widget(),
                        events_ListTile_widget(),
                        events_ListTile_widget(),
                        events_ListTile_widget(),
                      ],
                    ),
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
