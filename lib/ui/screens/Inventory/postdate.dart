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
  DateTime? _firstDate;
  DateTime? _lastDate;

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, bool isFirstDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isFirstDate ? (_firstDate ?? DateTime.now()) : (_lastDate ?? DateTime.now()),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isFirstDate ? _firstDate : _lastDate)) {
      setState(() {
        if (isFirstDate) {
          _firstDate = picked;
        } else {
          _lastDate = picked;
        }
      });
    }
  }

  void _handleGetMaterials() async {
    if (_formKey.currentState!.validate()) {
      if (_firstDate == null || _lastDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select both dates.')),
        );
        return;
      }

      await BlocProvider.of<InventoryCubit>(context)
          .getMaterial(_firstDate!.toIso8601String(), _lastDate!.toIso8601String());

      var list = BlocProvider.of<InventoryCubit>(context).material['data'];
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => InventoryView(list: list)),
      );
    }
  }

  void _handleExportFile() async {
    if (_formKey.currentState!.validate()) {
      if (_firstDate == null || _lastDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select both dates.')),
        );
        return;
      }

      await BlocProvider.of<InventoryCubit>(context)
          .exportFile(_firstDate!.toIso8601String(), _lastDate!.toIso8601String());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Inventory'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[50]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select the date range for your inventory:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Please choose the start and end dates for the inventory period. This will help you filter the inventory data based on the selected dates. Make sure to select both dates before proceeding.',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                const SizedBox(height: 16.0),
                _buildDateSelector('First Date', true),
                const SizedBox(height: 16.0),
                _buildDateSelector('Last Date', false),
                const SizedBox(height: 20.0),
                _buildSelectedDatesDisplay(),
                const SizedBox(height: 20.0),
                _buildActionButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateSelector(String label, bool isFirstDate) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
              const SizedBox(height: 8.0),
              ElevatedButton.icon(
                onPressed: () => _selectDate(context, isFirstDate),
                icon: Icon(Icons.calendar_today),
                label: Text(isFirstDate ? 'Select First Date' : 'Select Last Date'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedDatesDisplay() {
    return Center(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selected Dates:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 8.0),
              Text(
                'First Date: ${_firstDate != null ? _firstDate!.toLocal().toString().split(' ')[0] : 'Not selected'}',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'Last Date: ${_lastDate != null ? _lastDate!.toLocal().toString().split(' ')[0] : 'Not selected'}',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              onPressed: _handleGetMaterials,
              child: const Text('Get'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ElevatedButton(
              onPressed: _handleExportFile,
              child: const Text('Export'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}