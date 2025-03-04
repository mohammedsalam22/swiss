import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swis_warehouse/ui/screens/Auth/loginPage.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  Future<void> _logout(BuildContext context) async {
    // Get SharedPreferences instance
    SharedPreferences preferences = await SharedPreferences.getInstance();

    // Remove the token
    await preferences.remove('token'); // Replace 'token' with your actual key

    // Navigate to the login page
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginPage()), // Correctly instantiate LoginPage
    );    }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _logout(context),
      child: const Text('Logout'),
    );
  }
}