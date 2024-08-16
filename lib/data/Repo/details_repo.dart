import 'dart:convert';

import 'package:swis_warehouse/data/Api/details_api.dart';

class DetailsRepo {
  static Future material(int id) async {
    try {
      var response = await DetailsApi.material(id);
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }
}