import 'dart:convert';

import 'package:swis_warehouse/data/Api/home_api.dart';

import '../Api/donor_home_api.dart';

class DonorHomeRepo {
  static Future home () async {
    try {
      var response = await DonorHomeApi.Home() ;
      return jsonDecode(response) ;
    } catch (e) {
      rethrow ;
    }
  }
}