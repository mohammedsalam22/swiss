import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swis_warehouse/ui/screens/LoginPage.dart';
import 'package:swis_warehouse/ui/widgets/Customshapes/ShapeCircularacontainer.dart';
import 'package:swis_warehouse/ui/widgets/Customshapes/curved_edges.dart';
import 'package:swis_warehouse/ui/widgets/ElevatedButton.dart';
import 'package:swis_warehouse/ui/widgets/textFormField.dart';

class RegistrationInfo extends StatefulWidget {
  const RegistrationInfo({super.key});

  @override
  State<RegistrationInfo> createState() => _RegistrationInfoState();
}

class _RegistrationInfoState extends State<RegistrationInfo> {
  @override
  bool e = true;
  bool t = false;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                            height: 220,
                            child: Stack(
                              children: [
                                Positioned(
                                    top: -220,
                                    left: 300,
                                    child: ShapeCircularacontainer()),
                                Positioned(
                                    top: 80,
                                    left: 300,
                                    child: ShapeCircularacontainer()),
                                Positioned(
                                    top: 60,
                                    right: 180,
                                    child: Text(
                                      'Registration',
                                      style: TextStyle(
                                          fontSize: 40,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    )),
                                Positioned(
                                    top: 120,
                                    right: 105,
                                    child: Text(
                                      'only one step to get to your account',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white54),
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
                    top: 15,
                    bottom: 10,
                    labelText: 'UserName',
                    hintText: 'Enter your name',
                    suffixIcon: null,
                    keyboardType: TextInputType.name,
                    obscureText: true,
                    typeoffield: 'email',
                    validator: (val) {
                      // ignore: unrelated_type_equality_checks
                      if (val!.isEmpty || val.length < 10) {
                        return 'invalid phone number';
                      }
                      return null;
                    },
                  ),
                  TextfromField(
                    left: 19,
                    right: 19,
                    top: 15,
                    bottom: 0,
                    labelText: 'Code',
                    hintText: 'Enter Your Code',
                    suffixIcon: IconButton(
                      icon: (Icon(
                        e ? Icons.visibility : Icons.visibility_off,
                      )),
                      onPressed: () {
                        setState(() {
                          e = !e;
                        });
                      },
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: e,
                    typeoffield: 'password',
                    validator: (val) {
                      if (val!.isEmpty || val.length <= 7) {
                        return 'too short password';
                      }
                      return null;
                    },
                  ),
                  TextfromField(
                    left: 19,
                    right: 19,
                    top: 15,
                    bottom: 10,
                    labelText: 'Position ',
                    hintText: 'Enter your position',
                    suffixIcon: null,
                    keyboardType: TextInputType.name,
                    obscureText: t,
                    typeoffield: 'email',
                    validator: (val) {
                      // ignore: unrelated_type_equality_checks
                      if (val!.isEmpty || val.length < 5) {
                        return 'invalid position';
                      }
                      return null;
                    },
                  ),
                   Padding(
                    padding:
                    const EdgeInsets.only(left: 10, right: 10, top: 30),
                    child: Elevatedbutton(RouteName: 'RegistrationInfo',ButtonName: 'Get Started',),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
