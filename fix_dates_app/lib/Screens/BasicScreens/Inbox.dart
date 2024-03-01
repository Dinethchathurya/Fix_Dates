import 'package:fix_dates_app/components/Index/searchBar.dart';
import 'package:flutter/material.dart';

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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        events_ListTile_widget(
                          title: 'Mobile application ',
                          subtitle: Text('Event created'),
                          color: Colors.green,
                          time: '38m',
                          imagepath:
                              'https://media.licdn.com/dms/image/D4E03AQEzsOR7x1_qKw/profile-displayphoto-shrink_800_800/0/1666714485434?e=2147483647&v=beta&t=FXjmwhiEwvBvlVdHr605HjnYQ79yY_tnsOMZWshBj_s',
                        ),
                        events_ListTile_widget(
                          title: 'Mobile application ',
                          subtitle: Text('Event created'),
                          color: Colors.green,
                          time: '38m',
                          imagepath:
                              'https://media.licdn.com/dms/image/D4E03AQEzsOR7x1_qKw/profile-displayphoto-shrink_800_800/0/1666714485434?e=2147483647&v=beta&t=FXjmwhiEwvBvlVdHr605HjnYQ79yY_tnsOMZWshBj_s',
                        ),
                        events_ListTile_widget(
                          title: 'Mobile application ',
                          subtitle: Text('Event created'),
                          color: Colors.green,
                          time: '38m',
                          imagepath:
                              'https://media.licdn.com/dms/image/D4E03AQEzsOR7x1_qKw/profile-displayphoto-shrink_800_800/0/1666714485434?e=2147483647&v=beta&t=FXjmwhiEwvBvlVdHr605HjnYQ79yY_tnsOMZWshBj_s',
                        ),
                        events_ListTile_widget(
                          title: 'Mobile application ',
                          subtitle: Text('Event created'),
                          color: Colors.green,
                          time: '38m',
                          imagepath:
                              'https://media.licdn.com/dms/image/D4E03AQEzsOR7x1_qKw/profile-displayphoto-shrink_800_800/0/1666714485434?e=2147483647&v=beta&t=FXjmwhiEwvBvlVdHr605HjnYQ79yY_tnsOMZWshBj_s',
                        ),
                        events_ListTile_widget(
                          title: 'Mobile application ',
                          subtitle: Text('Event created'),
                          color: Colors.green,
                          time: '38m',
                          imagepath:
                              'https://media.licdn.com/dms/image/D4E03AQEzsOR7x1_qKw/profile-displayphoto-shrink_800_800/0/1666714485434?e=2147483647&v=beta&t=FXjmwhiEwvBvlVdHr605HjnYQ79yY_tnsOMZWshBj_s',
                        ),
                        events_ListTile_widget(
                          title: 'Mobile application ',
                          subtitle: Text('Event created'),
                          color: Colors.green,
                          time: '38m',
                          imagepath:
                              'https://media.licdn.com/dms/image/D4E03AQEzsOR7x1_qKw/profile-displayphoto-shrink_800_800/0/1666714485434?e=2147483647&v=beta&t=FXjmwhiEwvBvlVdHr605HjnYQ79yY_tnsOMZWshBj_s',
                        ),
                        events_ListTile_widget(
                          title: 'Mobile application ',
                          subtitle: Text('Event created'),
                          color: Colors.green,
                          time: '38m',
                          imagepath:
                              'https://media.licdn.com/dms/image/D4E03AQEzsOR7x1_qKw/profile-displayphoto-shrink_800_800/0/1666714485434?e=2147483647&v=beta&t=FXjmwhiEwvBvlVdHr605HjnYQ79yY_tnsOMZWshBj_s',
                        ),
                        events_ListTile_widget(
                          title: 'Mobile application ',
                          subtitle: Text('Event created'),
                          color: Colors.green,
                          time: '38m',
                          imagepath:
                              'https://media.licdn.com/dms/image/D4E03AQEzsOR7x1_qKw/profile-displayphoto-shrink_800_800/0/1666714485434?e=2147483647&v=beta&t=FXjmwhiEwvBvlVdHr605HjnYQ79yY_tnsOMZWshBj_s',
                        ),
                        events_ListTile_widget(
                          title: 'Mobile application ',
                          subtitle: Text('Event created'),
                          color: Colors.green,
                          time: '38m',
                          imagepath:
                              'https://media.licdn.com/dms/image/D4E03AQEzsOR7x1_qKw/profile-displayphoto-shrink_800_800/0/1666714485434?e=2147483647&v=beta&t=FXjmwhiEwvBvlVdHr605HjnYQ79yY_tnsOMZWshBj_s',
                        ),
                        events_ListTile_widget(
                          title: 'Mobile application ',
                          subtitle: Text('Event created'),
                          color: Colors.green,
                          time: '38m',
                          imagepath:
                              'https://media.licdn.com/dms/image/D4E03AQEzsOR7x1_qKw/profile-displayphoto-shrink_800_800/0/1666714485434?e=2147483647&v=beta&t=FXjmwhiEwvBvlVdHr605HjnYQ79yY_tnsOMZWshBj_s',
                        ),
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
