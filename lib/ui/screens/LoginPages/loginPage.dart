import 'package:flutter/material.dart';
import 'package:swis_warehouse/constant_stuff/routes_name.dart';
import 'package:swis_warehouse/ui/public_widgets/ElevatedButton.dart';
import 'package:swis_warehouse/ui/public_widgets/textFormField.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  bool trueObscure = true;
  bool falseObscure = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: _loginContainer(context),
          ),
        ),
      ),
    );
  }
  Container _loginContainer(BuildContext context) {
    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Image.asset('assets/logo.png'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            _emailTextField(),
            _passwordTextField(),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, forget_password);
                },
                child: const Text(
                  'forget password?',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width *0.22,
                  right: MediaQuery.of(context).size.width *0.22,
                  bottom: MediaQuery.viewInsetsOf(context).bottom + 10),
              child: const Elevatedbutton(
                RouteName: registeration,
                ButtonName: 'LogIn',
              ),
            )
          ],
        ));
  }
  TextfromField _passwordTextField() {
    return TextfromField(
      left: MediaQuery.of(context).size.width * 0.04,
      right: MediaQuery.of(context).size.width * 0.04,
      bottom: MediaQuery.viewInsetsOf(context).bottom + 15,
      labelText: 'Password',
      hintText: 'Enter Your Password',
      suffixIcon: IconButton(
        icon: (Icon(
          falseObscure ? Icons.visibility : Icons.visibility_off,
        )),
        onPressed: () {
          setState(() {
            falseObscure = !falseObscure;
          });
        },
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: falseObscure,
      typeoffield: 'password',
      validator: (val) {
        if (val!.isEmpty || val.length <= 7) {
          return 'too short password';
        }
        return null;
      },
    );
  }
  TextfromField _emailTextField() {
    return TextfromField(
      left: MediaQuery.of(context).size.width * 0.04,
      right: MediaQuery.of(context).size.width * 0.04,
      bottom: MediaQuery.viewInsetsOf(context).bottom,
      labelText: 'Email',
      hintText: 'Enter your email',
      suffixIcon: null,
      keyboardType: TextInputType.number,
      obscureText: trueObscure,
      typeoffield: 'email',
      validator: (val) {
        // ignore: unrelated_type_equality_checks
        if (val!.isEmpty || val.length < 10) {
          return 'invalid phone number';
        }
        return null;
      },
    );
  }
}