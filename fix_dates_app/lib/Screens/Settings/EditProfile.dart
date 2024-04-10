import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

final Logger _logger = Logger();

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController positionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      DocumentSnapshot userData =
          await _firestore.collection('users').doc('user_id_01').get();
      _logger.i('User Data: ${userData.data()}'); // Logging retrieved data
      if (userData.exists) {
        setState(() {
          nameController.text = userData['name'] ?? '';
          emailController.text = userData['email'] ?? '';
          phoneController.text = userData['phone'] ?? '';
          positionController.text = userData['position'] ?? '';
        });
      } else {
        _logger.w('User data does not exist for user_id_01');
      }
    } catch (e) {
      _logger.e('Error fetching profile: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text('Failed to fetch profile data. Please try again later.'),
        ));
      }
    }
  }

  void saveProfile() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).update({
          'name': nameController.text.trim(),
          'email': emailController.text.trim(),
          'phone': phoneController.text.trim(),
          'position': positionController.text.trim(),
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Profile saved successfully'),
          ));
        }
      }
    } catch (e) {
      _logger.e('Error saving profile: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Failed to save profile. Please try again later.'),
        ));
      }
    }
  }

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
                    saveProfile();
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
            backgroundImage: _imageFile == null
                ? const NetworkImage(
                    'https://e0.pxfuel.com/wallpapers/932/376/desktop-wallpaper-stylish-boys-cool-d-profile-pics-for-facebook-whatsapp-pretty-boys.jpg')
                : FileImage(File(_imageFile!.path)) as ImageProvider,
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
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
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
