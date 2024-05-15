import 'package:flutter/material.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/navigation_menu.dart';
import 'package:swis_warehouse/ui/widgets/Customshapes/ShapeCircularacontainer.dart';
import 'package:swis_warehouse/ui/widgets/Customshapes/curved_edges.dart';
import 'package:swis_warehouse/ui/widgets/ElevatedButton.dart';
import '../widgets/textFormField.dart';
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
                  _clippathWidget(),
                  const SizedBox(
                    height: 40,
                  ),
                  _emailTextField(),
                  _passwordTextField(),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_){
                          return const NavigationMenu();
                        }));
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
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 30),
                    child: Elevatedbutton(
                      RouteName: 'RegistrationInfo',
                      ButtonName: 'LogIn',
                    ),
                  )
                ],
              ));
  }

  TextfromField _passwordTextField() {
    return TextfromField(
      left: 19,
      right: 19,
      top: 15,
      bottom: 15,
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
      left: 19,
      right: 19,
      top: 15,
      bottom: 10,
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

  ClipPath _clippathWidget() {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: Column(
        children: [
          Container(
            color: Colors.red,
            padding: const EdgeInsets.all(0),
            child: const SizedBox(
              height: 380,
              child: Stack(
                children: [
                  Positioned(
                      top: -220, left: 300, child: ShapeCircularacontainer()),
                  Positioned(
                      top: 80, left: 300, child: ShapeCircularacontainer()),
                  Positioned(
                      top: 100,
                      right: 130,
                      child: Text(
                        'SingUp',
                        style: TextStyle(
                            fontSize: 48,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      )),
                  Positioned(
                      top: 160,
                      right: 100,
                      child: Text(
                        'create new account',
                        style: TextStyle(fontSize: 25, color: Colors.white54),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
