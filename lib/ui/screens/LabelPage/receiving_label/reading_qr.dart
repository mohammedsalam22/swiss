import 'package:flutter/material.dart';
import 'package:swis_warehouse/ui/screens/LabelPage/receiving_label/product.dart';
import 'package:swis_warehouse/ui/screens/LabelPage/receiving_label/product_items.dart';
import 'package:swis_warehouse/ui/screens/LabelPage/receiving_label/received_label.dart';

class ReceivingWarrantScreen extends StatefulWidget {
  const ReceivingWarrantScreen({super.key});

  @override
  _ReceivingWarrantScreenState createState() => _ReceivingWarrantScreenState();
}

class _ReceivingWarrantScreenState extends State<ReceivingWarrantScreen> {
  final List<Products> products = [
    Products(name: 'Product 1', imageUrl: 'assets/img_1.png', quantity: 1),
    Products(name: 'Product 2', imageUrl: 'assets/img_1.png', quantity: 2),
    Products(name: 'Product 3', imageUrl: 'assets/img_1.png', quantity: 3),
  ];

  void _saveData() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ReceivedLabel(
                products: products,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: buildMainScreen(context),
        ),
      ),
    );
  }

  Container buildMainScreen(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildImage(context),
          buildProductsList(),
          buildTextFieldsContainer(),
          buildButton()
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          )),
      title: const Text(
        'Receiving Warrant',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
      ),
    );
  }

  Container buildButton() {
    return Container(
      padding: const EdgeInsets.only(left: 100, top: 20),
      width: 300,
      child: ElevatedButton(
        onPressed: _saveData,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: const Text(
          'Save',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  Container buildTextFieldsContainer() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: 360,
      child: SingleChildScrollView(
        child: Column(
          children: [
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
          ],
        ),
      ),
    );
  }

  Container buildProductsList() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView.builder(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ProductItem(
            product: products[index],
            onQuantityChanged: (newQuantity) {
              setState(() {
                products[index].quantity = newQuantity;
              });
            },
          );
        },
      ),
    );
  }

  Container buildImage(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 100, right: 100),
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: ClipOval(
        child: Image.asset('assets/logo.png'),
      ),
    );
  }

  buildTextFormField(String labeltext) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
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
