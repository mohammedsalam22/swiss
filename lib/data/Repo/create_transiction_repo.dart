import 'dart:convert';

import 'package:swis_warehouse/data/Api/create_transiction.dart';

class CreateTransictionRepo {
  static Future sendTransiction(Map data) async {
    try {
      print('dsd') ;
      var response = await CreateTransictionApi.sendWarrent(data);
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }
}