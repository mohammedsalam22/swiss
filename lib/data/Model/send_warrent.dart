import 'package:swis_warehouse/data/Api/create_transiction.dart';

class SendWarrentModel {
  String warrentName;
  int warrentNum;
  int wieght;
  String date;
  String name;
  String companyName;
  int driverId;
  String details;

  SendWarrentModel(
      {required this.warrentName,
      required this.warrentNum,
      required this.wieght,
      required this.date,
      required this.name,
      required this.companyName,
      required this.driverId,
      required this.details});

  factory SendWarrentModel.initial() => SendWarrentModel(
      warrentName: '',
      warrentNum: 0,
      wieght: 0,
      date: '',
      name: '',
      companyName: '',
      driverId: 0,
      details: '');

  factory SendWarrentModel.fromJson(Map<String, dynamic> json) {
    return SendWarrentModel(
        warrentName: '',
        warrentNum: 0,
        wieght: 0,
        date: '',
        name: '',
        companyName: '',
        driverId: 0,
        details: '');
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "warrentName": warrentName,
      "warrentNum": warrentNum,
      "date": date,
      "name": name,
      "driverId": driverId,
      "details": details,
    };
  }
}
