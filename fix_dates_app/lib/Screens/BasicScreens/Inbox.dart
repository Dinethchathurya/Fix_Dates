import 'package:fix_dates_app/components/Index/events_ListTile_widget.dart';
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
              Container(
                height: 40.0,
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        size: 35.0,
                      ),
                      border: OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0)
                      // hintText: 'Enter a search term',
                      ),
                ),
              ),
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
        onPressed: () {},
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
