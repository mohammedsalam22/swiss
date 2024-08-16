import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swis_warehouse/bloc/Inventory/inventory_cubit.dart';
import 'package:swis_warehouse/ui/screens/Inventory/inventory_view.dart';

class PostDate extends StatefulWidget {
  @override
  _PostDateState createState() => _PostDateState();
}

class _PostDateState extends State<PostDate> {
  final _formKey = GlobalKey<FormState>();

  // Controllers to capture the data from the text fields
  final TextEditingController _firstFieldController = TextEditingController();
  final TextEditingController _secondFieldController = TextEditingController();

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      String firstFieldData = _firstFieldController.text;
      String secondFieldData = _secondFieldController.text;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Submitted Data'),
            content: Text(
                'First Field: $firstFieldData\nSecond Field: $secondFieldData'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () { Navigator.of(context).pop(); }, icon: Icon(Icons.arrow_back_ios),

        ),
        title: Text('Inventory'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _firstFieldController,
                decoration: const InputDecoration(
                  labelText: 'First Date',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _secondFieldController,
                decoration: const InputDecoration(
                  labelText: 'Last Date',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              Center(
                child: BlocBuilder<InventoryCubit, InventoryState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () async {
                        await BlocProvider.of<InventoryCubit>(context)
                            .getMaterial(_firstFieldController.text,
                            _secondFieldController.text);
                        var list = BlocProvider.of<InventoryCubit>(context)
                            .material['data'];
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => InventoryView(list: list)));
                      },
                      child: const Text('get'),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: BlocBuilder<InventoryCubit, InventoryState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () async {
                        await BlocProvider.of<InventoryCubit>(context)
                            .exportFile(_firstFieldController.text,
                            _secondFieldController.text);
                      },
                      child: const Text('export'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
