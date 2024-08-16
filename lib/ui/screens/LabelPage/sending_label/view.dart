import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swis_warehouse/bloc/warrent_cubit/warrent_cubit.dart';

class RequestWarrant extends StatefulWidget {
  const RequestWarrant({super.key});

  @override
  State<RequestWarrant> createState() => _RequestWarrantState();
}

class _RequestWarrantState extends State<RequestWarrant> {
  List<TextEditingController> materialControllers = [];
  List<TextEditingController> amountControllers = [];
  List<TextEditingController> driverControllers = [];
  List<TextEditingController> itemIdControllers = [];

  @override
  void initState() {
    super.initState();
    // Initialize with one field
    addField();
  }

  Map tr = {};

  // Function to add a new set of fields
  void addField() {
    setState(() {
      materialControllers.add(TextEditingController());
      amountControllers.add(TextEditingController());
      driverControllers.add(TextEditingController());
      itemIdControllers.add(TextEditingController());
    });
  }

  TextEditingController isConyey = TextEditingController();

  TextEditingController status = TextEditingController();

  TextEditingController date = TextEditingController();

  TextEditingController transactionType = TextEditingController();

  TextEditingController type = TextEditingController();

  TextEditingController waybillNum = TextEditingController();

  TextEditingController notes = TextEditingController();


  // Function to print the values of the controllers
  void printValues() {
    for (int i = 0; i < materialControllers.length; i++) {
      print(
          'Material: ${materialControllers[i].text}, Amount: ${amountControllers[i].text}');
    }
  }

  bool notcheked = false;
  bool cheked = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          child: Column(children: [
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              height: height * 0.8,
              width: width,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: width * 0.65, top: 0, bottom: height * 0.005),
                  child: const Text(
                    'Transiction',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: buildTextFormField('isConvey', isConyey),
                    ),
                    Expanded(
                      child: buildTextFormField('status', status),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: buildTextFormField('date', date),
                    ),
                    Expanded(
                      child: buildTextFormField(
                          'transaction type', transactionType),
                    ),
                  ],
                ),
                buildTextFormField('type', type),
                Row(
                  children: [
                    Expanded(
                      child: buildTextFormField('waybill_num', waybillNum),
                    ),
                    Expanded(
                      child: buildTextFormField('notes', notes),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Materials',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    const Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 125,
                    ),
                    const Text(
                      'New item',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                        onPressed: () => addField(),
                        icon: const Icon(
                          Icons.add_circle_outline_sharp,
                          color: Colors.black,
                          size: 30,
                        ))
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: materialControllers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: materialControllers[index],
                                decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            style: BorderStyle.solid,
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    labelText: 'material',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    filled: true,
                                    fillColor: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextField(
                                controller: amountControllers[index],
                                decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            style: BorderStyle.solid,
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    labelText: 'amount',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    filled: true,
                                    fillColor: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextField(
                                controller: driverControllers[index],
                                decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            style: BorderStyle.solid,
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    labelText: 'driver',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    filled: true,
                                    fillColor: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextField(
                                controller: itemIdControllers[index],
                                decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            style: BorderStyle.solid,
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    labelText: 'item',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    filled: true,
                                    fillColor: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 250),
                  child: _elevatedButton(),
                ),
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _elevatedButton() {
    return BlocListener<WarrentCubit, WarrentState>(
      listener: (context, state) {
        if (state.status == WarrentStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('done'))) ;
        }
      },
      child: Container(
          padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * 0.05,
          ),
          child: ElevatedButton(
            onPressed: () async {
              tr = {
                "is_convoy": isConyey.text,
                "status": status.text,
                "date": date.text,
                "transaction_type": transactionType.text,
                "type": type.text,
                "waybill_num": waybillNum.text,
                "notes[en]": notes.text,
              };
              for (int i = 0; i < amountControllers.length; i++) {
                tr['items[${i + 1}][warehouse_id]'] =
                    materialControllers[i].text;
                tr['items[${i + 1}][item_id]'] = itemIdControllers[i].text;
                tr['items[${i + 1}][quantity]'] = amountControllers[i].text;
                tr['drivers[${i + 1}][driver_id]'] = driverControllers[i].text;
              }
              print(tr) ;
              await BlocProvider.of<WarrentCubit>(context).warrent(tr) ;
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 255, 0, 0)),
              minimumSize: MaterialStateProperty.all(Size(
                  MediaQuery.of(context).size.width * 0.3,
                  MediaQuery.of(context).size.height * 0.06)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10), // Set the border radius to 0 for rectangle
                ),
              ),
            ),
            child: const Text(
              'submit',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )),
    );
  }

  buildTextFormField(String labeltext, TextEditingController controller) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, style: BorderStyle.solid, color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(10))),
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
