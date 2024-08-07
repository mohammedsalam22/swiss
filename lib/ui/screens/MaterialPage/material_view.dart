import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:swis_warehouse/ui/screens/MaterialPage/details_page.dart';
import 'package:swis_warehouse/ui/screens/MaterialPage/material_info.dart';
import 'package:flutter/material.dart';

class Materials extends StatefulWidget {
  const Materials({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MaterialsState();
}

class MaterialsState extends State<Materials> {
  final List<String> images = [];
  final List<MaterialInformations> products = [
    MaterialInformations(
        id: 2,
        scientific_name: 'From Donor',
        manufacturer: 'Syria',
        date: '22/2',
        image: '',
        price: '25',
        productname: 'Gold',
        quantity: 6),
    MaterialInformations(
        id: 2,
        scientific_name: 'From Donor',
        manufacturer: 'Syria',
        date: '23/2',
        image: '',
        price: '15',
        productname: 'Silver',
        quantity: 6),
    MaterialInformations(
        id: 2,
        scientific_name: 'From Donor',
        manufacturer: 'Syria',
        date: '23/2',
        image: '',
        price: '15',
        productname: 'Silver',
        quantity: 6),
    MaterialInformations(
        id: 2,
        scientific_name: 'From Donor',
        manufacturer: 'Syria',
        date: '23/2',
        image: '',
        price: '15',
        productname: 'Silver',
        quantity: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            'Materials page',
            style: TextStyle(fontWeight: FontWeight.w500),
          )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    ...products.map((val) {
                      return SingleChildScrollView(
                          child: Container(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Card(
                          surfaceTintColor: Colors.white,
                          shadowColor: Colors.black45,
                          color: Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0))),
                          elevation: 7,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 12, right: 0, left: 0, bottom: 12),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 10),
                                  child: ClipOval(
                                      clipBehavior: Clip.antiAlias,
                                      child: Image.asset(
                                        'assets/img_1.png',
                                        fit: BoxFit.contain,
                                      )),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          val.productname,
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            val.price.toString(),
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Source ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17),
                                        ),
                                        Text(
                                          val.scientific_name,
                                          style: const TextStyle(
                                              color: Colors.red, fontSize: 17),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => Details(
                                        id: val.id,
                                        productname: val.productname,
                                        scientific_name: val.scientific_name,
                                        manufacturer: val.manufacturer,
                                        date: val.date,
                                        price: val.price,
                                        quantity: val.quantity,
                                      ),
                                    ));
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.info,
                                    color: Colors.red,
                                    size: 26,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ));
                    }).toList(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
