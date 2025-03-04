class Transaction {
  final String transaction_type;
  final String code;
  final String transaction_mode_type;
  final String date;
  final String status;
  final int id;
  final int is_convoy;
  final String notes;
  final int waybill_num;
  final String waybill_img;
  final Map<String, dynamic> source;
  final List<Map<String, dynamic>> details; // Add details property  

  Transaction({
    required this.transaction_type,
    required this.code,
    required this.transaction_mode_type,
    required this.date,
    required this.status,
    required this.id,
    required this.is_convoy,
    required this.notes,
    required this.waybill_num,
    required this.waybill_img,
    required this.source,
    required this.details, // Include details in the constructor  
  });

  factory Transaction.fromMap(Map<String, dynamic> json) {
    return Transaction(
      transaction_type: json['transaction_type'],
      code: json['code'],
      transaction_mode_type: json['transaction_mode_type'],
      date: json['date'],
      status: json['status'],
      id: json['id'],
      is_convoy: json['is_convoy'],
      notes: json['notes'],
      waybill_num: json['waybill_num'],
      waybill_img: json['waybill_img'],
      source: json['source'],
      details: List<Map<String, dynamic>>.from(json['details'] ?? []), // Parse details  
    );
  }
}  