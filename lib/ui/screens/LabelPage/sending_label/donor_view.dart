import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/create_donor_transiction_cubit/create_donor_transiction_cubit.dart';

class CreateDonorTransiction extends StatefulWidget {
  const CreateDonorTransiction({super.key});

  @override
  State<CreateDonorTransiction> createState() => _CreateDonorTransictionState();
}

class _CreateDonorTransictionState extends State<CreateDonorTransiction> {
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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(width * 0.05), // Responsive padding
          child: Column(
            children: [
              SizedBox(height: height * 0.01),
              Text(
                'Create Transaction',
                style: TextStyle(
                    fontSize: width * 0.05, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: height * 0.02),

              // Input fields
              Row(
                children: [
                  Expanded(child: buildTextFormField('Is Convey', isConyey)),
                  SizedBox(width: width * 0.02), // Responsive spacing
                  Expanded(child: buildTextFormField('Status', status)),
                ],
              ),
              Row(
                children: [
                  Expanded(child: buildTextFormField('Date', date)),
                  SizedBox(width: width * 0.02), // Responsive spacing
                  Expanded(
                      child: buildTextFormField(
                          'Transaction Type', transactionType)),
                ],
              ),
              buildTextFormField('Type', type),
              Row(
                children: [
                  Expanded(
                      child: buildTextFormField('Waybill Num', waybillNum)),
                  SizedBox(width: width * 0.02), // Responsive spacing
                  Expanded(child: buildTextFormField('Notes', notes)),
                ],
              ),
              SizedBox(
                height: 15,
              ), // Materials section
              Divider(),

              Row(
                children: [
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
                  const Spacer(), // Use Spacer for responsive spacing

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
                    ),
                  ),
                ],
              ),

              // List of materials
              ListView.builder(
                shrinkWrap: true,
                // Prevents the ListView from taking infinite height
                physics: NeverScrollableScrollPhysics(),
                // Disable scrolling for the ListView
                itemCount: materialControllers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.01, horizontal: width * 0.02),
                    child: Row(
                      children: [
                        Expanded(
                          child: buildMaterialInputField(
                              'Material', materialControllers[index]),
                        ),
                        SizedBox(width: width * 0.02),
                        Expanded(
                          child: buildMaterialInputField(
                              'Amount', amountControllers[index]),
                        ),
                        SizedBox(width: width * 0.02),
                        Expanded(
                          child: buildMaterialInputField(
                              'Driver', driverControllers[index]),
                        ),
                        SizedBox(width: width * 0.02),
                        Expanded(
                          child: buildMaterialInputField(
                              'Item', itemIdControllers[index]),
                        ),
                      ],
                    ),
                  );
                },
              ),

              // Submit button
              Padding(
                padding: EdgeInsets.only(top: height * 0.02),
                child: _elevatedButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _elevatedButton() {
    return BlocListener<CreateDonorTransictionCubit,
        CreateDonorTransictionState>(
      listener: (context, state) {
        if (state.status == CreateDonorTransictionStatus.success) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Done')));
        }
      },
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
            tr['items[${i + 1}][warehouse_id]'] = materialControllers[i].text;
            tr['items[${i + 1}][item_id]'] = itemIdControllers[i].text;
            tr['items[${i + 1}][quantity]'] = amountControllers[i].text;
            tr['drivers[${i + 1}][driver_id]'] = driverControllers[i].text;
          }
          print(tr);
          await BlocProvider.of<CreateDonorTransictionCubit>(context)
              .transiction(tr);
        },
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(const Color.fromARGB(255, 255, 0, 0)),
          minimumSize: MaterialStateProperty.all(Size(
              MediaQuery.of(context).size.width * 0.3,
              MediaQuery.of(context).size.height * 0.06)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: const Text(
          'Submit',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget buildTextFormField(
      String labelText, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1, style: BorderStyle.solid, color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          labelText: labelText,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget buildMaterialInputField(
      String labelText, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                width: 1, style: BorderStyle.solid, color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        labelText: labelText,
        border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
