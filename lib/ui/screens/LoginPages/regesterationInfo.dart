import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swis_warehouse/constant_stuff/routes_name.dart';
import 'package:swis_warehouse/ui/public_widgets/Customshapes/ShapeCircularacontainer.dart';
import 'package:swis_warehouse/ui/public_widgets/Customshapes/curved_edges.dart';
import 'package:swis_warehouse/ui/public_widgets/ElevatedButton.dart';
import 'package:swis_warehouse/ui/public_widgets/textFormField.dart';

class RegistrationInfo extends StatefulWidget {
  const RegistrationInfo({super.key});

  @override
  State<RegistrationInfo> createState() => _RegistrationInfoState();
}

class _RegistrationInfoState extends State<RegistrationInfo> {
  bool e = true;
  bool t = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            width: width,
            height: height,
            child: Column(
              children: [
                ClipPath(
                  clipper: CustomCurvedEdges(),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        color: Colors.red,
                        padding: const EdgeInsets.all(0),
                        child: Stack(
                          children: [
                            Positioned(
                                top: MediaQuery.viewInsetsOf(context).top -
                                    height * 0.2,
                                left: MediaQuery.viewInsetsOf(context).left +
                                    width * 0.7,
                                child: const ShapeCircularacontainer()),
                            Positioned(
                                top: MediaQuery.viewInsetsOf(context).top + 100,
                                left: MediaQuery.viewInsetsOf(context).left +
                                    width * 0.7,
                                child: const ShapeCircularacontainer()),
                            Positioned(
                                top: MediaQuery.viewInsetsOf(context).top +
                                    height * 0.1,
                                right: MediaQuery.viewInsetsOf(context).right +
                                    width * 0.4,
                                child: const Text(
                                  'Registration',
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                )),
                            Positioned(
                                top: MediaQuery.viewInsetsOf(context).top +
                                    height * 0.16,
                                right: MediaQuery.viewInsetsOf(context).right +
                                    width * 0.22,
                                child: const Text(
                                  'only one step to get to your account',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white54),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                TextfromField(
                  left: width * 0.05,
                  right: width * 0.05,
                  bottom: 0,
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
                  left: width * 0.05,
                  right: width * 0.05,
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
                  left: width * 0.05,
                  right: width * 0.05,
                  bottom: MediaQuery.viewInsetsOf(context).bottom + 25,
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
                  padding: EdgeInsets.only(left: width *0.18, right: width*0.18),
                  child: const Elevatedbutton(
                    RouteName: navbar,
                    ButtonName: 'Get Started',
                  ),
                )
              ],
            )),
      ),
    );
  }
}
