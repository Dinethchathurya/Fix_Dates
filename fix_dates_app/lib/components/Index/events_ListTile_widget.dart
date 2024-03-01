import 'package:flutter/material.dart';

class events_ListTile_widget extends StatelessWidget {
  events_ListTile_widget(
      {required this.imagepath,
      required this.title,
      required this.color,
      required this.subtitle,
      required this.time});
  String imagepath;
  String title;
  Widget? subtitle;
  Color? color;
  String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black, // Set the border color
                width: 2.0, // Set the border width
              ),
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                imagepath,
              ),
              radius: 30.0,
            ),
          ),
          title: Text(title),
          subtitle: subtitle,
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.circle,
                size: 15,
                color: color,
              ),
              SizedBox(height: 5),
              // Add some spacing between the icon and the text
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}
