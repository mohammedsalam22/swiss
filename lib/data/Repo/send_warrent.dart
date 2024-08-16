import 'dart:convert';

import 'package:swis_warehouse/data/Api/register_api.dart';
import 'package:swis_warehouse/data/Api/sending_warrent.dart';

class SendWarrentRepo {
  Future sendWarrent(
      String warrentName,
      int warrentNum,
      int wieght,
      String date,
      String name,
      String companyName,
      int driverId,
      String details) async {
    try {
      // var response = await SendWarrentApi.sendWarrent(warrentName, warrentNum,
      //     wieght, date, name, companyName, driverId, details);
      // return jsonDecode(response);
    } catch (error) {
      throw Exception('error in repo');
    }
  }
}
