import 'package:fix_dates_app/components/CreateGroup/GroupList.dart';
import 'package:fix_dates_app/components/Index/events_ListTile_widget.dart';
import 'package:fix_dates_app/components/Index/searchBar.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatelessWidget {
  const CreateGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
            Colors.blue[700]!,
          )),
          onPressed: () {},
          child: Text(
            'Create',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Create Group'),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: [
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

              // SingleChildScrollExpandedWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
