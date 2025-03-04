// lib/widgets/transaction_card.dart
import 'package:flutter/material.dart';
import 'package:swis_warehouse/ui/screens/LabelStatus/widgets/transaction.dart';

class TransactionCard extends StatefulWidget {
  final Transaction transaction;

  const TransactionCard({super.key, required this.transaction});

  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    Color statusColor =
        widget.transaction.status == 'COMPLETED' ? Colors.green : Colors.orange;
    IconData statusIcon = widget.transaction.status == 'COMPLETED'
        ? Icons.check_circle
        : Icons.hourglass_empty;

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.transaction.transaction_type,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                Row(
                  children: [
                    Icon(statusIcon, color: statusColor),
                    SizedBox(width: 4),
                    IconButton(
                      icon: Icon(
                          _isExpanded
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          color: Colors.red),
                      onPressed: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                widget.transaction.status,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            if (_isExpanded) ...[
              SizedBox(height: 8),
              Divider(color: Colors.grey[300]),
              SizedBox(height: 8),
              Text(
                'Code: ${widget.transaction.code}',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.transaction.date,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontFamily: 'Roboto',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showDetailsBottomSheet(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red[800],
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      'All Details',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showDetailsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.85,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.transaction.waybill_img.isNotEmpty) ...[
                  Center(
                    child: Image.network(
                      widget.transaction.waybill_img,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
                Text(
                  'Transaction Details',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[800],
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 16),
                _buildDetailRow(Icons.code, 'Code: ${widget.transaction.code}'),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 12),
                _buildDetailRow(
                    Icons.calendar_today, 'Date: ${widget.transaction.date}'),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 12),
                _buildDetailRow(Icons.note,
                    'Notes: ${widget.transaction.notes.isNotEmpty ? widget.transaction.notes : "No notes"}'),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 12),
                _buildDetailRow(Icons.info,
                    'Transaction Type: ${widget.transaction.transaction_type}'),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 12),
                _buildDetailRow(Icons.attach_money,
                    'Transaction Mode: ${widget.transaction.transaction_mode_type}'),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 12),
                _buildDetailRow(Icons.confirmation_number,
                    'Waybill Number: ${widget.transaction.waybill_num}'),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 12),
                _buildDetailRow(
                    Icons.check_circle, 'Status: ${widget.transaction.status}'),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 12),
                _buildDetailRow(Icons.person,
                    'Source Type: ${widget.transaction.source['type']}'),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 12),
                _buildDetailRow(Icons.person,
                    'Source Name: ${widget.transaction.source['name']}'),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 12),
                _buildDetailRow(Icons.info,
                    'Is Convoy: ${widget.transaction.is_convoy == 1 ? "Yes" : "No"}'),
                SizedBox(height: 16),

                // Details Section
                Text(
                  'Details:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[800],
                  ),
                ),
                SizedBox(height: 8),
                if (widget.transaction.details.isNotEmpty) ...[
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.transaction.details.length,
                    itemBuilder: (context, index) {
                      final detail = widget.transaction.details[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${detail['item']} (CTN: ${detail['CTN']})',
                              style: TextStyle(color: Colors.black87),
                            ),
                            Text(
                              'Quantity: ${detail['quantity']}',
                              style: TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],

                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red[800],
                    ),
                    child: Text(
                      'Close',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.red[800]),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
