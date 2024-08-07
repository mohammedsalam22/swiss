import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swis_warehouse/ui/screens/LabelPage/receiving_label/received_label.dart';
import 'package:swis_warehouse/ui/screens/LabelStatus/status_list.dart';

import '../LabelPage/receiving_label/product.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StatusScreenState();
}

class StatusScreenState extends State<StatusScreen> {
  String statu = 'paid';
  final List<StatusInfo> li = [
    StatusInfo(
        date: 'qwer',
        price: 'wer',
        financialStatu: 'wer',
        ordernumber: 'wer',
        orderstatue: 'wer',
        quantitiy: [],
        products: []),
    StatusInfo(
        date: 'qwer',
        price: 'wer',
        financialStatu: 'wer',
        ordernumber: 'wer',
        orderstatue: 'wer',
        quantitiy: [],
        products: []),
    StatusInfo(
        date: 'qwer',
        price: 'wer',
        financialStatu: 'wer',
        ordernumber: 'wer',
        orderstatue: 'wer',
        quantitiy: [],
        products: [])
  ];
  final List<Products> products = [
    Products(name: 'Product 1', imageUrl: 'assets/img_1.png', quantity: 1),
    Products(name: 'Product 2', imageUrl: 'assets/img_1.png', quantity: 2),
    Products(name: 'Product 3', imageUrl: 'assets/img_1.png', quantity: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'LabelStatus',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [_ListViewProducts()],
          ),
        ));
  }

  Widget _ListViewProducts() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...li.map((val) {
            return SingleChildScrollView(
                child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Card(
                      surfaceTintColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      elevation: 2,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                Container(
                                    width: 100,
                                    height: 100,
                                    child: Image.asset('assets/img_1.png')),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          val.ordernumber,
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      Text(
                                        val.price.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                      Text(
                                        val.financialStatu,
                                        style: const TextStyle(fontSize: 18),
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      val.orderstatue,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      val.date,
                                      style: const TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ReceivedLabel(
                                                    products: products,
                                                  )));
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: Color.fromRGBO(0, 186, 175, 1),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ));
          }).toList(),
        ],
      ),
    );
  }
// Future register() async {
//   print('wait');
//   try {
//
//     var response = await http.get(Uri.parse('${Api.api}/orders'), headers: {
//       "Accept": "application/json",
//       'Authorization': 'Bearer ${Token.token}'
//     });
//     print('response is ${response.body}');
//     print('response is ${response.statusCode}');
//     if (response.statusCode == 200) {
//       var r = jsonDecode(response.body)["data"];
//       li.clear();
//       for (int i = 0; i < r.length; i++) {
//         li.add(ScreensInfo(
//           date: r[i]['created_at'],
//           price: r[i]['total'].toString(),
//           financialStatu: 'un paid',
//           ordernumber: r[i]['id'].toString(),
//           orderstatue:  r[i]['order_status'],
//           quantitiy: r[i]['quantity_items'],
//           products: r[i]['product'],
//         ));
//       }
//     } else {
//       print('errrrrrror');
//     }
//   } catch (NullPointerException) {
//     print('sorry');
//   }
// }
}
