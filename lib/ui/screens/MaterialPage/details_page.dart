// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:swis_warehouse/ui/screens/MaterialPage/material_info.dart';

class Details extends StatefulWidget {
  const Details(
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
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final List<MaterialInformations> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: textRow(context),
            ),
            _logo(context),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: firstRow(),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: secondRow(),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: thirdRow(),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  // color: theme.colorScheme.secondary,
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        size: 28,
                        // color: theme.primaryColor,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Row thirdRow() {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Price',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Open_Sans',
                          color: Colors.grey,
                        )),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(widget.price.toString(),
                        style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Open_Sans',
                            color: Colors.black87))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Amount ',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Open_Sans',
                            color: Colors.grey)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.quantity.toString(),
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Open_Sans',
                          color: Colors.black87),
                    )
                  ],
                ),
              ],
            );
  }

  Row secondRow() {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Expired Date',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Open_Sans',
                          color: Colors.grey,
                        )),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(widget.date,
                        style: const TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.w500,
                            fontFamily: 'Open_Sans',
                            // color: Color.fromRGBO(0, 186, 175, 1)
                            color: Colors.black87))
                  ],
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Medicine Type',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Open_Sans',
                            color: Colors.grey)),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Pain reliever',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Open_Sans',
                          color: Colors.black87),
                    )
                  ],
                ),
              ],
            );
  }

  Row firstRow() {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Com. Name',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Open_Sans',
                          color: Colors.grey,
                        )),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(widget.productname,
                        style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Open_Sans',
                            color: Colors.black87))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Company',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Open_Sans',
                            color: Colors.grey)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.manufacturer,
                      style: const TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.w500,
                          fontFamily: 'Open_Sans',
                          // color: Color.fromRGBO(0, 186, 175, 1)
                          color: Colors.black87),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Sci. Name',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Open_Sans',
                            color: Colors.grey)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(widget.scientific_name,
                        style: const TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.w500,
                            // color: Color.fromRGBO(0, 186, 175, 1)
                            color: Colors.black87))
                  ],
                ),
              ],
            );
  }

  Row textRow(BuildContext context) {
    return Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.red,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(
                  width: 85,
                ),
                const Center(
                  child: Text(
                    'Details Page',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            );
  }

  Padding _logo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.8,
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
