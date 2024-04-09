import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  XFile? _imageFile;
  final ImagePicker picker = ImagePicker();

  EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: <Widget>[
            imageProfile(),
            const SizedBox(height: 20),
            nameTextField(controller: nameController),
            const SizedBox(height: 20),
            emailTextField(controller: emailController),
            const SizedBox(height: 20),
            phoneTextField(controller: phoneController),
            const SizedBox(height: 20),
            postionTextField(controller: positionController),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                UpdateProfileButton(
                  buttonName: 'Save',
                  onPressed: () {
                    // Add functionality to save profile here
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600], // Background color
                    foregroundColor: Colors.white, // Text color
                  ),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 80.0,
            backgroundImage: widget._imageFile == null
                ? const NetworkImage(
                        'https://e0.pxfuel.com/wallpapers/932/376/desktop-wallpaper-stylish-boys-cool-d-profile-pics-for-facebook-whatsapp-pretty-boys.jpg')
                    as ImageProvider
                : FileImage(File(widget._imageFile!.path)) as ImageProvider,
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile Photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: const Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: const Text("Camara"),
              ),
              TextButton.icon(
                icon: const Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: const Text("Gallery"),
              ),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await widget.picker.pickImage(
      source: source,
    );
    setState(() {
      widget._imageFile = pickedFile;
    });
  }

  Widget nameTextField({TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        labelText: "Name",
        labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 140, 255)),
      ),
    );
  }

  Widget emailTextField({TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        labelText: "Email",
        labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 140, 255)),
      ),
    );
  }

  Widget phoneTextField({TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        labelText: "Phone",
        labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 140, 255)),
      ),
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
            borderSide: const BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        labelText: "Position",
        labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 140, 255)),
      ),
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
