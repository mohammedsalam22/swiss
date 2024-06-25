import 'package:flutter/material.dart';
import 'package:swis_warehouse/ui/screens/ForgetPassword/reset_password.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  _VerifyCodeScreenState createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController codeController = TextEditingController();
  bool isButtonActive = false;

  @override
  void initState() {
    super.initState();
    codeController.addListener(() {
      setState(() {
        isButtonActive = codeController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    codeController.dispose();
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
        ),
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
                'please Enter your code to reset your password',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 20.0),
            codeTextField(),
            const SizedBox(height: 20.0),
            buildElevatedButton(context),
          ],
        ),
      ),
    );
  }

  TextField codeTextField() {
    return TextField(
            controller: codeController,
            decoration: InputDecoration(
              labelText: 'Verification Code',
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
                      MaterialPageRoute(
                          builder: (context) => ResetPasswordScreen()),
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
              'Verify',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          );
  }
}
