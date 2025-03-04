import 'dart:convert';

import 'package:swis_warehouse/data/Api/register_api.dart';

class RegisterRepo {
  Future register(String name, String phone, String password,String password_confirmation) async {
    try {
      var response = await RegisterApi.registerAuth(name,phone,password,password_confirmation);
      print('salam');

      return jsonDecode(response);
    } catch (error) {
      throw Exception('error in repo');
    }
  }
}
