import 'dart:convert';
import 'package:swis_warehouse/data/Api/login_api.dart';

import '../Api/material_api.dart';
class MaterialsRepo {
  static Future material() async {
    try {
      var response = await MaterialApi.material();
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }

  static Future materialApi(String url) async {
    try {
      var response = await MaterialApi.materialCalled(url);
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }
}
