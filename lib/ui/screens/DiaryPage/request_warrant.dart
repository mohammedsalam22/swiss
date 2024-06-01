import 'package:flutter/material.dart';
class RequestWarrant extends StatefulWidget {
  const RequestWarrant({super.key});

  @override
  State<RequestWarrant> createState() => _RequestWarrantState();
}

class _RequestWarrantState extends State<RequestWarrant> {
  bool notcheked = false;
  bool cheked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 670,
              width: double.infinity,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 160, top: 0, bottom: 10),
                    child: Text(
                      'Request Warrent',
                      style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: buildTextFormField('WarrentNum'),
                      ),
                      Expanded(
                        child: buildTextFormField('PhoneNum'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: buildTextFormField('Wieght'),
                      ),
                      Expanded(
                        child: buildTextFormField('Recieved date'),
                      ),
                    ],
                  ),

                  buildTextFormField('Drivers name'),
                  Row(
                    children: [
                      Expanded(
                        child: buildTextFormField('Company name'),
                      ),
                      Expanded(
                        child: buildTextFormField('Drivers Id'),
                      ),
                    ],
                  ),
                  buildTextFormField('More details'),
                  Expanded(
                    child: Row(
                      children: [
                        _chekedboxWidget(),
                        _elevatedButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _elevatedButton() {
    return Padding(
                          padding:
                              const EdgeInsets.only(right: 5,top: 20),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 255, 0, 0)),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(150, 50)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Set the border radius to 0 for rectangle
                                ),
                              ),
                            ),
                            child: const Text(
                              'submit',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ));
  }

  Expanded _chekedboxWidget() {
    return Expanded(
                        child: Column(
                          children: [
                            CheckboxListTile(
                              controlAffinity:
                                  ListTileControlAffinity.leading,
                              value: notcheked,
                              onChanged: (val) {
                                setState(() {
                                  notcheked = val!;
                                });
                              },
                              title: const Text('WareHouse'),
                            ),
                            CheckboxListTile(
                              controlAffinity:
                                  ListTileControlAffinity.leading,
                              value: cheked,
                              onChanged: (val) {
                                setState(() {
                                  cheked = val!;
                                });
                              },
                              title: const Text('Donor'),
                            ),
                          ],
                        ),
                      );
  }

  buildTextFormField(String labeltext) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, style: BorderStyle.solid, color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            labelText: labeltext,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            filled: true,
            fillColor: Colors.white),
      ),
    );
  }
}
