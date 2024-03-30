import 'package:flutter/material.dart';
import './edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String buttonName = 'Edit Profile';
  String cancelButtonName = 'Cancel';
  int currentIndex = 0;
  bool isEditing = false;

  // Define controllers for each text field
  TextEditingController nameController =
      TextEditingController(text: 'John Doe');
  TextEditingController emailController =
      TextEditingController(text: 'johndoe@example.com');
  TextEditingController phoneController =
      TextEditingController(text: '123-456-7890');
  TextEditingController positionController =
      TextEditingController(text: 'Software Engineer');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: <Widget>[
            imageProfile(),
            SizedBox(height: 20),
            nameTextField(controller: nameController),
            SizedBox(height: 20),
            emailTextField(controller: emailController),
            SizedBox(height: 20),
            phoneTextField(controller: phoneController),
            SizedBox(height: 20),
            postionTextField(controller: positionController),
            SizedBox(height: 20),
            if (isEditing)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UpdateProfileButton(
                    buttonName: buttonName,
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isEditing = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600], // Background color
                      foregroundColor: Colors.white, // Text color
                    ),
                    child: Text(cancelButtonName),
                  ),
                ],
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(label: 'Chats', icon: Icon(Icons.chat)),
          BottomNavigationBarItem(
              label: 'Contacts', icon: Icon(Icons.contact_page)),
          BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings))
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 80.0,
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1lwwJppbrXMIF_aCdEYkB--qaXJ3emA2dNv-NsXdR2Q&s'),
          ),
          if (!isEditing)
            Positioned(
              bottom: 20.0,
              right: 20.0,
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }

  Widget nameTextField({TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        labelText: "Name",
        labelStyle: TextStyle(color: Color.fromARGB(255, 0, 140, 255)),
      ),
      onTap: () {
        setState(() {
          isEditing = true;
        });
      },
    );
  }

  Widget emailTextField({TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        labelText: "Email",
        labelStyle: TextStyle(color: Color.fromARGB(255, 0, 140, 255)),
      ),
      onTap: () {
        setState(() {
          isEditing = true;
        });
      },
    );
  }

  Widget phoneTextField({TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        labelText: "Phone",
        labelStyle: TextStyle(color: Color.fromARGB(255, 0, 140, 255)),
      ),
      onTap: () {
        setState(() {
          isEditing = true;
        });
      },
    );
  }

  Widget postionTextField({TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        labelText: "Position",
        labelStyle: TextStyle(color: Color.fromARGB(255, 0, 140, 255)),
      ),
      onTap: () {
        setState(() {
          isEditing = true;
        });
      },
    );
  }
}

class UpdateProfileButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;

  const UpdateProfileButton({
    required this.buttonName,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[600], // Background color
        foregroundColor: Colors.white, // Text color
      ),
      child: Text(buttonName),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}
