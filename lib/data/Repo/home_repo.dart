import 'dart:convert';

import 'package:swis_warehouse/data/Api/home_api.dart';

class HomeRepo {
  static Future home () async {
    try {
      var response = await HomeApi.Home() ;
      return jsonDecode(response) ;
    } catch (e) {
      rethrow ;
    }
  }
}