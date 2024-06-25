import 'package:flutter/material.dart';
import 'package:swis_warehouse/ui/screens/HomePage/home_view.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isButtonActive = false;

  @override
  void initState() {
    super.initState();
    confirmPasswordController.addListener(() {
      setState(() {
        isButtonActive = confirmPasswordController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios),
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Reset Password',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'please Enter Your new password and confirm the password',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 20.0),
            passwordTextField(),
            const SizedBox(height: 10.0),
            confirmTextField(),
            const SizedBox(height: 20.0),
            buildElevatedButton(context),
          ],
        ),
      ),
    );
  }

  TextField confirmTextField() {
    return TextField(
            controller: confirmPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          );
  }

  TextField passwordTextField() {
    return TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'New Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          );
  }

  ElevatedButton buildElevatedButton(BuildContext context) {
    return ElevatedButton(
            onPressed: isButtonActive
                ? () {
                    // Implement verification logic here
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeView()),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              backgroundColor: isButtonActive ? Colors.red : Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Text(
              'Recover',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          );
  }
}
