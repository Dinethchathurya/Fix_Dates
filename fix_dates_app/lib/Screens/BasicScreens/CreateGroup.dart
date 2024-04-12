import 'package:fix_dates_app/Screens/BasicScreens/Inbox.dart'; // Import the Inbox page
import 'package:fix_dates_app/components/Index/searchBar.dart';
import 'package:fix_dates_app/database/create_new_group.dart'; // Import the backend code
import 'package:fix_dates_app/database/getUsers.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  GetUsers getusers = GetUsers();
  CreateNewGroup createNewGroup = CreateNewGroup(); // Instance of backend class

  // State variables
  String groupName = '';
  List<String> selectedUsers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.blue[700]!,
            ),
          ),
          onPressed: () {
            // Call method to create group
            CreateNewGroup createNewGroup = CreateNewGroup();
            createNewGroup.createGroup(groupName, selectedUsers);
            // createGroup();
          },
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
              // Text field for entering group name
              TextField(
                onChanged: (value) {
                  setState(() {
                    groupName = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Group Name',
                ),
              ),
              const SizedBox(height: 20),
              IndexSearchBar(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: StreamBuilder(
                    stream: getusers.getInfoStream(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            var document = snapshot.data.docs[index];
                            // Checkbox for selecting users
                            return CheckboxListTile(
                              title: Text(document['email']),
                              value: selectedUsers.contains(document['Uid']),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value!) {
                                    selectedUsers.add(document['Uid']);
                                  } else {
                                    selectedUsers.remove(document['Uid']);
                                  }
                                });
                              },
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to create group
  void createGroup() {
    if (groupName.isNotEmpty && selectedUsers.isNotEmpty) {
      // Call backend method to create group
      createNewGroup.createGroup(groupName, selectedUsers);
      // Clear the group name and selected users
      setState(() {
        groupName = '';
        selectedUsers.clear();
      });
      // Navigate to the Inbox page after creating the group
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Inbox()),
      );
    } else {
      // Show an error message if group name or selected users are empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a group name and select users.'),
        ),
      );
    }
  }
}
