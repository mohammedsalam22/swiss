import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swis_warehouse/bloc/Register/register_cubit.dart';
import 'package:swis_warehouse/constant_stuff/routes_name.dart';

import '../../shared_widgets/Customshapes/ShapeCircularacontainer.dart';
import '../../shared_widgets/Customshapes/curved_edges.dart';
import '../../shared_widgets/ElevatedButton.dart';
import '../../shared_widgets/textFormField.dart';
import '../HomePage/widgets/navigation_menu.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  // Obscure text controllers
  bool passwordObscure = true;
  bool confirmPasswordObscure = true;

  // Form and text controllers
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Image.asset('assets/logo.png'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  _nameTextField(),
                  _phoneTextField(),
                  _passwordTextField(),
                  _confirmPasswordTextField(),
                  buildButton(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.22,
        right: MediaQuery.of(context).size.width * 0.22,
        bottom: MediaQuery.viewInsetsOf(context).bottom + 10,
      ),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return Elevatedbutton(
            RouteName: registeration,
            ButtonName: 'Register',
            function: () async {
              if (_formKey.currentState!.validate()) {
                RegisterCubit completeprofile =
                    BlocProvider.of<RegisterCubit>(context);
                await completeprofile.postRegister(
                    nameController.text,
                    phoneController.text,
                    passwordController.text,
                    confirmPasswordController.text);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('All fields are required and must be valid'),
                  ),
                );
              }
            },
          );
        },
        listener: (BuildContext context, RegisterState state) {
          if (state.status == RegisterStatus.success) {
            // Retrieve first_login and type from SharedPreferences
            SharedPreferences.getInstance().then((prefs) {
              int? firstLogin = prefs.getInt('first_login');
              int? userType = prefs.getInt('type');

              // Navigation logic based on first_login and type
                if (firstLogin == 0) {
                // First login = 0, navigate based on user type
                switch (userType) {
                  case 2:
                    // Type 2, navigate to Navigation Menu (Home)
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => NavigationMenu()),
                    );
                    break;
                  case 3:
                    // Type 3, navigate to Profile Page
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => NavigationMenu()),
                    );
                    break;
                }
              } else {
                // Unexpected first_login value, fallback to Login
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => CompleteProfile()),
                );
              }

              // Show success message
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Registration Successful')),
              );
            });
          } else if (state.status ==RegisterStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Registration Error')),
            );
          }
        },
      ),
    );
  }

  TextfromField _nameTextField() {
    return TextfromField(
      left: MediaQuery.of(context).size.width * 0.04,
      right: MediaQuery.of(context).size.width * 0.04,
      bottom: 10,
      labelText: 'Name',
      hintText: 'Enter your name',
      suffixIcon: null,
      keyboardType: TextInputType.name,
      obscureText: false,
      typeoffield: 'name',
      validator: (val) {
        if (val!.isEmpty || val.length < 3) {
          return 'Name must be at least 3 characters';
        }
        return null;
      },
      controller: nameController,
    );
  }

  TextfromField _phoneTextField() {
    return TextfromField(
      left: MediaQuery.of(context).size.width * 0.04,
      right: MediaQuery.of(context).size.width * 0.04,
      bottom: 10,
      labelText: 'Phone',
      hintText: 'Enter your phone number',
      suffixIcon: null,
      keyboardType: TextInputType.text,
      obscureText: false,
      typeoffield: 'phone',
      validator: (val) {
        if (val!.isEmpty || val.length != 13) {
          return 'Invalid phone number (must be 12 digits)';
        }
        return null;
      },
      controller: phoneController,
    );
  }

  TextfromField _passwordTextField() {
    return TextfromField(
      left: MediaQuery.of(context).size.width * 0.04,
      right: MediaQuery.of(context).size.width * 0.04,
      bottom: 10,
      labelText: 'Password',
      hintText: 'Enter your password',
      suffixIcon: IconButton(
        icon: Icon(
          passwordObscure ? Icons.visibility : Icons.visibility_off,
        ),
        onPressed: () {
          setState(() {
            passwordObscure = !passwordObscure;
          });
        },
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: passwordObscure,
      typeoffield: 'password',
      validator: (val) {
        if (val!.isEmpty || val.length < 8) {
          return 'Password must be at least 8 characters';
        }
        return null;
      },
      controller: passwordController,
    );
  }

  TextfromField _confirmPasswordTextField() {
    return TextfromField(
      left: MediaQuery.of(context).size.width * 0.04,
      right: MediaQuery.of(context).size.width * 0.04,
      bottom: 10,
      labelText: 'Confirm Password',
      hintText: 'Confirm your password',
      suffixIcon: IconButton(
        icon: Icon(
          confirmPasswordObscure ? Icons.visibility : Icons.visibility_off,
        ),
        onPressed: () {
          setState(() {
            confirmPasswordObscure = !confirmPasswordObscure;
          });
        },
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: confirmPasswordObscure,
      typeoffield: 'password',
      validator: (val) {
        if (val!.isEmpty) {
          return 'Please confirm your password';
        }
        if (val != passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
      controller: confirmPasswordController,
    );
  }
}
