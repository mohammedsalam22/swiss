import 'dart:convert';
import 'package:swis_warehouse/data/Api/login_api.dart';

import '../Api/material_api.dart';
import '../Api/transiction_status.dart';
class TransictionDonorStatusRepo {
  static Future transiction() async {
    try {
      var response = await TransictionStatusApi.transiction();
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }

  static Future transictionApi(String url) async {
    try {
      var response = await TransictionStatusApi.transictionCalled(url);
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }
}
