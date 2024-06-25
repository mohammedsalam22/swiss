import 'package:flutter/material.dart';
import 'package:swis_warehouse/ui/screens/LabelPage/receiving_label/product.dart';


class ReceivedLabel extends StatefulWidget {
  const ReceivedLabel({super.key, required this.products});

  final List<Products> products;

  @override
  State<ReceivedLabel> createState() => _ReceivedLabelState();
}

class _ReceivedLabelState extends State<ReceivedLabel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.grey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildImage(context),
                  buildProductstList(),
                  buildTextFieldsContainer(),
                ],
              ),
            ),
          ),
        ));
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

  Container buildProductstList() {
    return Container(
                  height: 90,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ListView.builder(
                    itemCount: widget.products.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 300,
                        child: Card(
                          elevation: 2,
                          surfaceTintColor: Colors.white,
                          color: Colors.white,
                          child: ListTile(
                            leading: Image.asset(
                              widget.products[index].imageUrl,
                              width: 100,
                            ),
                            title: Text(widget.products[index].name),
                            subtitle: Row(
                              children: [
                                Text('Quantity: ${widget.products[index].quantity}'),
                                const SizedBox(width: 16),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
  }

  Container buildImage(BuildContext context) {
    return Container(
                  padding: const EdgeInsets.only(left: 100, right: 100),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: ClipOval(
                    child: Image.asset('assets/logo.png'),
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
