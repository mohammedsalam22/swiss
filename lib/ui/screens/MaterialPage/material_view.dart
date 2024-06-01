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
        body: SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ...products.map((val) {
                  return SingleChildScrollView(
                      child: Card(
                    surfaceTintColor: Colors.white,
                    shadowColor: Colors.black45,
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 30, right: 10, left: 10, bottom: 30),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              SizedBox(
                                  width: 100,
                                  height: 80,
                                  child: Image.asset('assets/img_1.png')),
                            ],
                          )),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'name: ${val.productname}',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  val.scientific_name,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 17),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Total: ${val.price.toString()}',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 17),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Details(
                                      id: val.id,
                                      productname: val.productname,
                                      scientific_name: val.scientific_name,
                                      manufacturer: val.manufacturer,
                                      date: val.date,
                                      price: val.price,
                                      quantity: val.quantity,
                                    ),));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.black45),
                                    minimumSize: MaterialStateProperty.all(
                                        const Size(60, 40)),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10), // Set the border radius to 0 for rectangle
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    'Details',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
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
