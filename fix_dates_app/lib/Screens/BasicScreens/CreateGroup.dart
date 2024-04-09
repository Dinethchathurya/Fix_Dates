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
                      ],
                    ),
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
