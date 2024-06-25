import 'package:flutter/material.dart';
import 'package:swis_warehouse/ui/screens/ForgetPassword/verify_code.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Forget Password',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'please Enter your registered  email to reset your password',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 30.0),
            emailTextField(),
            const SizedBox(height: 30.0),
            buildElevatedButton(context),
          ],
        ),
      ),
    );
  }

  TextField emailTextField() {
    return TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'salam@gmail.com',
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
            onPressed: () {
              // Implement sending email logic here
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VerifyCodeScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Text(
              'Send',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          );
  }
}
