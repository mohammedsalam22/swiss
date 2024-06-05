import 'package:flutter/material.dart';
import 'package:swis_warehouse/ui/public_widgets/Customshapes/ShapeCircularacontainer.dart';
import 'package:swis_warehouse/ui/public_widgets/Customshapes/curved_edges.dart';
import 'package:swis_warehouse/ui/public_widgets/ElevatedButton.dart';
import 'package:swis_warehouse/ui/public_widgets/textFormField.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool e = true;
  bool t = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                ClipPath(
                  clipper: CustomCurvedEdges(),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.red,
                        padding: const EdgeInsets.all(0),
                        child: const SizedBox(
                          height: 290,
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 85,
                                  right: 125,
                                  child: Text(
                                    'Forget Password',
                                    style: TextStyle(
                                        fontSize: 35,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  )),
                              Positioned(
                                  top: 155,
                                  right: 45,
                                  child: Column(
                                    children: [
                                      Text(
                                        'please enter your registration email or',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white54),
                                      ),
                                      Text(
                                        'your  phone to reset your password',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white54),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextfromField(
                  left: 19,
                  right: 19,
                  bottom: 10,
                  labelText: 'Enter your email/phone',
                  hintText: '',
                  suffixIcon: null,
                  keyboardType: TextInputType.name,
                  obscureText: true,
                  typeoffield: 'email',
                  validator: (val) {
                    // ignore: unrelated_type_equality_checks
                    if (val!.isEmpty || val.length < 10) {
                      return 'invalid email';
                    }
                    return null;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 30),
                  child: Elevatedbutton(
                    RouteName: '',
                    ButtonName: 'Recover Password',
                  ),
                )
              ],
            )),
      ),
    );
  }
}
