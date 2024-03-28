import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditProfilePage extends StatelessWidget {
  String buttonName = 'Update Profile';
  int currentIndex = 0;

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
              SizedBox(
                height: 20,
              ),
              nameTextField(),
              SizedBox(
                height: 20,
              ),
              emailTextField(),
              SizedBox(
                height: 20,
              ),
              phoneTextField(),
              SizedBox(
                height: 20,
              ),
              postionTextField(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

// importing profile photos
  Widget imageProfile() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: AssetImage("images/1.jpeg"),
        ),
      ],
    );
  }

// creating textfields
  Widget nameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Colors.blue,
          ),
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
    );
  }

  Widget emailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.blue,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        labelText: "Email",
        labelStyle: TextStyle(color: Color.fromARGB(255, 0, 140, 255)),
      ),
    );
  }

  Widget phoneTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.blue,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        labelText: "Phone",
        labelStyle: TextStyle(color: Color.fromARGB(255, 0, 140, 255)),
      ),
    );
  }

  Widget postionTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.blue,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        labelText: "Postion",
        labelStyle: TextStyle(color: Color.fromARGB(255, 0, 140, 255)),
      ),
    );
  }
}
