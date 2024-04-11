import 'package:flutter/material.dart';

class BlockedUsers extends StatefulWidget {
  @override
  _BlockedUsersPageState createState() => _BlockedUsersPageState();
}

class _BlockedUsersPageState extends State<BlockedUsers> {
  List<User> blockedUsers = [
    User(username: 'User1', profilePhoto: 'img.jpg'),
    User(username: 'User2', profilePhoto: 'img.jpg'),
    User(username: 'User3', profilePhoto: 'img.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blocked Users'),
      ),
      body: ListView.builder(
        itemCount: blockedUsers.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(blockedUsers[index].profilePhoto),
            ),
            title: Text(blockedUsers[index].username),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _unblockUser(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewBlockedUser();
        },
        child: Icon(Icons.block),
      ),
    );
  }

  void _addNewBlockedUser() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newBlockedUser = '';
        return AlertDialog(
          title: Text('Block New Contact'),
          content: TextField(
            onChanged: (value) {
              newBlockedUser = value;
            },
            decoration: InputDecoration(
              hintText: 'Enter username',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  blockedUsers.add(
                    User(
                        username: newBlockedUser,
                        profilePhoto: 'assets/default_profile.jpg'),
                  );
                });
                Navigator.of(context).pop();
              },
              child: Text('Block'),
            ),
          ],
        );
      },
    );
  }

  void _unblockUser(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Unblock User'),
          content: Text(
              'Are you sure you want to unblock ${blockedUsers[index].username}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  blockedUsers.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: Text('Unblock'),
            ),
          ],
        );
      },
    );
  }
}

class User {
  final String username;
  final String profilePhoto;

  User({required this.username, required this.profilePhoto});
}
