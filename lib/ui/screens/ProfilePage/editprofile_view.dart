import 'package:flutter/material.dart';
import 'package:swis_warehouse/ui/screens/ProfilePage/personal_info.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String name = "Mohammed salam";
  String email = "salam@example.com";
  String phone = "+0987654321";
  String address = "Alhamra street";
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
        appBar: AppBar(
          title: Text('Personal Info'),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
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
              Container(
                height: 50,
                width: 100,
                child: ElevatedButton(
                  onPressed: _toggleEdit,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(isEditing ? "Save" : "Edit"),
                      Icon(Icons.edit)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
