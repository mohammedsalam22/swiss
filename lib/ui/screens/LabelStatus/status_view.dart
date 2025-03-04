// lib/screens/transaction_status_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swis_warehouse/ui/screens/LabelStatus/widgets/summary_card.dart';
import 'package:swis_warehouse/ui/screens/LabelStatus/widgets/transaction.dart';
import 'package:swis_warehouse/ui/screens/LabelStatus/widgets/transaction_card.dart';
import '../../../bloc/TransictionStatus/transiction_status_cubit.dart';


class TransictionStatusScreen extends StatefulWidget {
  const TransictionStatusScreen({super.key});

  @override
  State<TransictionStatusScreen> createState() => _TransictionStatusScreenState();
}

class _TransictionStatusScreenState extends State<TransictionStatusScreen> {
  List transactions = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<TransictionStatusCubit>(context, listen: false).gettransiction();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transaction Status',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<TransictionStatusCubit, TransictionStatusState>(
        builder: (context, state) {
          if (state.status == TransictionStatus.loading) {
            return Center(child: CircularProgressIndicator(color: Colors.red));
          }
          if (BlocProvider.of<TransictionStatusCubit>(context).material == null) {
            return Center(child: CircularProgressIndicator(color: Colors.black));
          }

          transactions = BlocProvider.of<TransictionStatusCubit>(context).material['data'];
          List<Transaction> transactionList = transactions.map((data) => Transaction.fromMap(data)).toList();

          return Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.grey[100]),
            child: Column(
              children: [
                _buildSummaryCards(transactionList),
                SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemCount: transactionList.length,
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return TransactionCard(transaction: transactionList[index]);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSummaryCards(List<Transaction> transactionList) {
    int completedCount = transactionList.where((transaction) => transaction.status == 'COMPLETED').length;
    int inDeliveryCount = transactionList.where((transaction) => transaction.status == 'InDelivery').length;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SummaryCard(
          title: 'COMPLETED',
          amount: '$completedCount',
          color: Colors.green,
          icon: Icons.check_circle,
        ),
        SummaryCard(
          title: 'InDelivery',
          amount: '$inDeliveryCount',
          color: Colors.orange,
          icon: Icons.local_shipping,
        )
      ],
    );
  }
}