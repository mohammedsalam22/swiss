import 'dart:convert';
import 'package:swis_warehouse/data/Api/login_api.dart';

import '../Api/material_api.dart';
import '../Api/transiction_info_api.dart';
import '../Api/transiction_status.dart';
class TransictionInfoRepo {
  static Future transiction(int id) async {
    try {
      var response = await TransictionInfoApi.transictionInfo(id);
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }

}
