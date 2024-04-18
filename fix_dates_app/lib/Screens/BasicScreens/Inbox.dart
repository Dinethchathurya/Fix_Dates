import 'package:fix_dates_app/Screens/BasicScreens/GetMyEvents.dart';
import 'package:fix_dates_app/database/getGroups.dart';
import 'package:flutter/material.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  GetUsersGroups getUsersGroups = GetUsersGroups();

  @override
  void initState() {
    super.initState();
    getUsersGroups.getGroups();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Inbox')),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(
                Icons.meeting_room,
                size: 30,
              ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile"),
                onTap: () {
                  Navigator.pushNamed(context, '/EditProfile');
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {
                  Navigator.pushNamed(context, '/DeleteAccount');
                },
              ),
              ListTile(
                leading: Icon(Icons.privacy_tip),
                title: Text("Privacy Policy"),
                onTap: () {
                  Navigator.pushNamed(context, '/PrivacyPolicy');
                },
              ),
              ListTile(
                leading: Icon(Icons.picture_as_pdf_rounded),
                title: Text("Terms & Conditions"),
                onTap: () {
                  Navigator.pushNamed(context, '/TermsAndCondition');
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: () {
                  Navigator.pushNamed(context, '/Logout');
                },
              ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Groups',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder<List<dynamic>>(
                  stream: getUsersGroups.getGroups(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      List<dynamic>? groups = snapshot.data;
                      if (groups == null || groups.isEmpty) {
                        return Center(child: Text('No groups found.'));
                      } else {
                        return ListView.builder(
                        itemCount: groups.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage('lib/images/group.png'),
                                    radius: 30.0,
                                  ),
                                ),
                                title: Text(groups[index]),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => GetMyEvents(groupName: groups[index]),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 10.0), // Move it inside the Column
                            ],
                          );
                        },
                      );    
                      }
                    }
                  },
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
//groups[index]
