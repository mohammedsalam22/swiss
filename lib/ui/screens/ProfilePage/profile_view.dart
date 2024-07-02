import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "salam";
  String email = "salam@example.com";
  String phone = "+0987654321";
  String address = "Alhamra street";
  File? _profileImage;

  final ImagePicker _picker = ImagePicker();
  bool isEditing = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = name;
    _emailController.text = email;
    _phoneController.text = phone;
    _addressController.text = address;
  }
  Future<void> _pickImage() async {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _profileImage = File(pickedFile.path);
        });
      }
    }
  void _toggleEdit() {
    setState(() {
      if (isEditing) {
        name = _nameController.text;
        email = _emailController.text;
        phone = _phoneController.text;
        address = _addressController.text;
      }
      isEditing = !isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _profileImage != null
                    ? FileImage(_profileImage!)
                    : const AssetImage('assets/logo.png') as ImageProvider,
              ),
            ),
            const SizedBox(height: 16),
            isEditing
                ? TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            )
                : Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            PersonalInfo(
              title: "Email",
              controller: _emailController,
              isEditing: isEditing,
            ),
            PersonalInfo(
              title: "Phone",
              controller: _phoneController,
              isEditing: isEditing,
            ),
            PersonalInfo(
              title: "Address",
              controller: _addressController,
              isEditing: isEditing,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _toggleEdit,
              child: Text(isEditing ? "Save" : "Edit"),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Code to change language
              },
              child: Text("Change Language"),
            ),
            ElevatedButton(
              onPressed: () {
                // Code to logout
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonalInfo extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isEditing;

  PersonalInfo({
    required this.title,
    required this.controller,
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            flex: 3,
            child: isEditing
                ? TextField(
              controller: controller,
              decoration: InputDecoration(border: OutlineInputBorder()),
            )
                : Text(
              controller.text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
