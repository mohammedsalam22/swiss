// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:swis_warehouse/ui/screens/MaterialPage/material_info.dart';

class ReciveWarrent extends StatefulWidget {
  const ReciveWarrent(
      {Key? key,
      required this.id,
      required this.scientific_name,
      required this.productname,
      required this.manufacturer,
      required this.date,
      required this.price,
      required this.quantity})
      : super(key: key);
  final int id;
  final String scientific_name;
  final String productname;
  final String manufacturer;
  final String date;
  final String price;
  final int quantity;

  @override
  State<ReciveWarrent> createState() => _ReciveWarrent();
}

class _ReciveWarrent extends State<ReciveWarrent> {
  final List<MaterialInformations> products = [
    MaterialInformations(
        id: 1,
        scientific_name: '',
        manufacturer: '',
        date: '',
        image: '',
        price: '',
        productname: 'gold',
        quantity: 6),
    MaterialInformations(
        id: 1,
        scientific_name: '',
        manufacturer: '',
        date: '',
        image: '',
        price: '',
        productname: 'silver',
        quantity: 8),
    MaterialInformations(
        id: 1,
        scientific_name: '',
        manufacturer: '',
        date: '',
        image: '',
        price: '',
        productname: 'rice',
        quantity: 5),
    MaterialInformations(
        id: 1,
        scientific_name: '',
        manufacturer: '',
        date: '',
        image: '',
        price: '',
        productname: 'apple',
        quantity: 15),
    MaterialInformations(
        id: 1,
        scientific_name: '',
        manufacturer: '',
        date: '',
        image: '',
        price: '',
        productname: 'gold',
        quantity: 30)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: 220,
                child: _warrentPhoto(context)),
            Container(
              padding: const EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.black12.withOpacity(0.05),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Column(children: [
                const Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Text(
                      'Materials',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 26,
                          color: Colors.blueGrey),
                    )),
                    SizedBox(
                      width: 165,
                    ),
                    Expanded(
                        child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 20,
                      color: Colors.blueGrey,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                materialsListView(),
                buildTextPadding(),
                firsDetailsRow(),
                const SizedBox(
                  height: 10,
                ),
                secoundDetailsRow(),
                const SizedBox(
                  height: 10,
                ),
                thirdDetailsRow(),
                const SizedBox(
                  height: 25,
                ),
              ]),
            )
          ],
        ),
      ),
    ));
  }

  Padding buildTextPadding() {
    return const Padding(
                padding: EdgeInsets.only(right: 230, bottom: 15,top: 10),
                child: Text(
                  'More Details',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey),
                ),
              );
  }

  Container thirdDetailsRow() {
    return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Notes',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey,
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(widget.productname,
                            style: const TextStyle(fontSize: 18, color: Colors.black87))
                      ],
                    ),
                  ],
                ),
              );
  }

  Container secoundDetailsRow() {
    return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Date',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey,
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(widget.date,
                            style: const TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.w500,
                                // color: Color.fromRGBO(0, 186, 175, 1)
                                color: Colors.black87))
                      ],
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Code',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueGrey)),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Pain reliever',
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                        )
                      ],
                    ),
                  ],
                ),
              );
  }

  Container firsDetailsRow() {
    return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                padding: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Warrent Name',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey,
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(widget.productname,
                            style: const TextStyle(fontSize: 18, color: Colors.black87))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Type',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Open_Sans',
                                color: Colors.blueGrey)),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.manufacturer,
                          style: const TextStyle(fontSize: 18, color: Colors.black87),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Quantity',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueGrey)),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(widget.scientific_name,
                            style: const TextStyle(fontSize: 18, color: Colors.black87))
                      ],
                    ),
                  ],
                ),
              );
  }

  Container materialsListView() {
    return Container(
      padding: EdgeInsets.only(top: 10),
                height: 120,
                child: ListView.separated(
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            height: 100,
                            width: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Image.asset(
                                    'assets/img_1.png',
                                  )),
                                  Center(
                                    child: Text(
                                      products[index].productname,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Text(
                                    'quantity: ${products[index].quantity.toString()}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                ),
              );
  }

  Padding _warrentPhoto(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 4,
        decoration: const BoxDecoration(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const Image(
            image: AssetImage('assets/logo.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
