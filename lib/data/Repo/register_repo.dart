import 'dart:convert';

import 'package:swis_warehouse/data/Api/register_api.dart';

class RegisterRepo {
  Future register(int phone, String name, String type) async {
    try {
      var response = await RegisterApi.registerAuth(phone, name, type);
      return jsonDecode(response);
    } catch (error) {
      throw Exception('error in repo');
    }
  }
}
