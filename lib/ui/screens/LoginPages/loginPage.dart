import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swis_warehouse/constant_stuff/routes_name.dart';
import 'package:swis_warehouse/ui/public_widgets/ElevatedButton.dart';
import 'package:swis_warehouse/ui/public_widgets/textFormField.dart';

import '../../../bloc/Login/login_cubit.dart';
import '../../../data/Api/login_api.dart';
import '../HomePage/home_view.dart';
import '../HomePage/widgets/navigation_menu.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool trueObscure = true;
  bool falseObscure = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
            buildForgetPassword(context),
            buildButton(context)
          ],
        ));
  }

  Padding buildButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.22,
          right: MediaQuery.of(context).size.width * 0.22,
          bottom: MediaQuery.viewInsetsOf(context).bottom + 10),
      child: BlocConsumer<LoginCubit, LoginState>(
        builder: (context, state) {
          return Elevatedbutton(
              RouteName: registeration,
              ButtonName: 'LogIn',
              function: () async {
                print(emailController.text);
                if (_formKey.currentState!.validate()) {
                  LoginCubit loginCubit = BlocProvider.of<LoginCubit>(context);
                  await loginCubit.postLogin(
                      emailController.text, passwordController.text);
                  // Navigator.of(context).pushReplacement(
                  //     MaterialPageRoute(builder: (_) => const NavigationMenu()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                            Text('all category is required to add correctly')),
                  );
                  //Navigator.of(context).pushReplacement(
                  //  MaterialPageRoute(builder: (_) => const NavigationMenu()));
                }
              });
        },
        listener: (BuildContext context, LoginState state) {
          if (state.status == LoginStatus.success) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const NavigationMenu()));
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('done Successfully')));
          } else if (state.status == LoginStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('not apidone Successfully')));
          }
        },
      ),
    );
  }

  Center buildForgetPassword(BuildContext context) {
    return Center(
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
    );
  }

  TextfromField _passwordTextField() {
    return TextfromField(
      left: MediaQuery.of(context).size.width * 0.04,
      right: MediaQuery.of(context).size.width * 0.04,
      bottom: 10,
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
      controller: passwordController,
    );
  }

  TextfromField _emailTextField() {
    return TextfromField(
      left: MediaQuery.of(context).size.width * 0.04,
      right: MediaQuery.of(context).size.width * 0.04,
      bottom: 0,
      labelText: 'Email',
      hintText: 'Enter your email',
      suffixIcon: null,
      keyboardType: TextInputType.emailAddress,
      obscureText: falseObscure,
      typeoffield: 'email',
      validator: (val) {
        // ignore: unrelated_type_equality_checks
        if (val!.isEmpty || val.length < 10) {
          return 'invalid phone number';
        }
        return null;
      },
      controller: emailController,
    );
  }
}
