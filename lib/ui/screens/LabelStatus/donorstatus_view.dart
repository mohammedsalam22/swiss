// lib/screens/transaction_status_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swis_warehouse/ui/screens/LabelStatus/widgets/summary_card.dart';
import 'package:swis_warehouse/ui/screens/LabelStatus/widgets/transaction.dart';
import 'package:swis_warehouse/ui/screens/LabelStatus/widgets/transaction_card.dart';
import '../../../bloc/TransictionStatus/transiction_status_cubit.dart';
import '../../../bloc/TransictionStatusDonor/transiction_donor_status_cubit.dart';


class DonorTransictionStatus extends StatefulWidget {
  const DonorTransictionStatus({super.key});

  @override
  State<DonorTransictionStatus> createState() => _DonorTransictionStatusState();
}

class _DonorTransictionStatusState extends State<DonorTransictionStatus> {
  List transactions = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<TransictionDonorStatusCubit>(context, listen: false).gettransiction();
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
      body: BlocBuilder<TransictionDonorStatusCubit, TransictionDonorStatusState>(
        builder: (context, state) {
          if (state.status == TransictionDonorStatus.loading) {
            return Center(child: CircularProgressIndicator(color: Colors.red));
          }
          if (BlocProvider.of<TransictionDonorStatusCubit>(context).material == null ||
              BlocProvider.of<TransictionDonorStatusCubit>(context).material['data'].isEmpty) {
            return Center(
              child: Text(
                "There are no items at the moment.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          transactions = BlocProvider.of<TransictionDonorStatusCubit>(context).material['data'];
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
    int completedCount = transactionList.where((transaction) => transaction.status == 'Completed').length;
    int inDeliveryCount = transactionList.where((transaction) => transaction.status == 'InDelivery').length;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SummaryCard(
          title: 'Completed',
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