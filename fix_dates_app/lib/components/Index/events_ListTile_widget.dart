import 'package:flutter/material.dart';

class events_ListTile_widget extends StatelessWidget {
  const events_ListTile_widget({
    super.key,
  });

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
                'https://media.licdn.com/dms/image/D4E03AQEzsOR7x1_qKw/profile-displayphoto-shrink_800_800/0/1666714485434?e=2147483647&v=beta&t=FXjmwhiEwvBvlVdHr605HjnYQ79yY_tnsOMZWshBj_s',
              ),
              radius: 30.0,
            ),
          ),
          title: Text('Mobile application Group'),
          subtitle: Text('New meeting sheduled'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.circle,
                size: 15,
                color: Colors.green,
              ),
              SizedBox(
                  height: 5), // Add some spacing between the icon and the text
              Text(
                '38m',
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
