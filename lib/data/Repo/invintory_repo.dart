import 'dart:convert';
import 'package:swis_warehouse/data/Api/inventory_api.dart';
import 'package:swis_warehouse/data/Api/login_api.dart';

import '../Api/material_api.dart';
class InventoryRepo {
  static Future material(String Firstdate,String LastDate) async {
    try {
      var response = await InvintoryApi.material(Firstdate,LastDate);
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }

}
