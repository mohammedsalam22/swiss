import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swis_warehouse/ui/screens/ProfilePage/editprofile_view.dart';
import 'package:swis_warehouse/ui/screens/ProfilePage/personal_info.dart';
import 'dart:io';

import '../../../constant_stuff/routes_name.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "Mohammed salam";
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
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 75,
                backgroundImage: _profileImage != null
                    ? FileImage(_profileImage!)
                    : const AssetImage('assets/personal photo.jpg')
                        as ImageProvider,
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
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
            accountContainer(),
            Container(
              color: Colors.grey.shade300,
              height: 15,
              width: double.infinity,
            ),
            settingsContainer(context),
          ],
        ),
      ),
    );
  }

  Container accountContainer() {
    return Container(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 290),
            child: Text(
              'Account',
              style: TextStyle(
                  fontSize: 19, fontWeight: FontWeight.w500, color: Colors.red),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: PersonalInfo(
              title: "Email",
              controller: _emailController,
              isEditing: isEditing,
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: PersonalInfo(
              title: "Phone",
              controller: _phoneController,
              isEditing: isEditing,
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: PersonalInfo(
              title: "Address",
              controller: _addressController,
              isEditing: isEditing,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.light_mode_outlined))
      ],
      leading: IconButton(
          onPressed: _toggleEdit,
          icon: isEditing ? const Icon(Icons.done) : const Icon(Icons.edit,size: 25,)),
    );
  }

  Container settingsContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
      height: 500,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 15, right: 5),
            child: Text(
              'Settings',
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 19, color: Colors.red),
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, edit),
            child: const ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side: BorderSide(color: Colors.grey, width: 1.0),
              ),
              leading: Icon(Icons.storage),
              title: Text('Data & Storage'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            trailing: Text(
              'English',
              style: TextStyle(fontSize: 18, color: Colors.indigo),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide(color: Colors.grey, width: 1.0),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, aboutUs);
            },
            child: const ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('about us'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side: BorderSide(color: Colors.grey, width: 1.0),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, terms);
            },
            child: const ListTile(
              leading: Icon(Icons.rule_sharp),
              title: Text('terms&conditions '),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side: BorderSide(color: Colors.grey, width: 1.0),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, loginScreen);
            },
            child: const ListTile(
              leading: Icon(Icons.logout),
              title: Text('logout'),
            ),
          ),
        ],
      ),
    );
  }
}
