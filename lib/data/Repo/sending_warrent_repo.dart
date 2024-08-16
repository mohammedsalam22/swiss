import 'dart:convert';

import 'package:swis_warehouse/data/Api/sending_warrent.dart';

class SendingWarrentRepo {
  static Future sendWarrent(Map data) async {
    try {
      print('dsd') ;
      var response = await SendWarrentApi.sendWarrent(data);
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }
}