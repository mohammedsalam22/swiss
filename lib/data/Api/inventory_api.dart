import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swis_warehouse/constant_stuff/url.dart';

import '../../constant_stuff/Token.dart';

class InvintoryApi {
  static String? message;

  static Future material(String Firstdate,String LastDate) async {
    // final FlutterSecureStorage secureStorage = FlutterSecureStorage();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print(Firstdate) ;
    try {
      var response = await http.get(
        Uri.parse('$url/api/inventoryForKeeper?start_date=$Firstdate&end_date=$LastDate'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${preferences.get('token')}'
        },

      );
      print(response.body) ;
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (error) {
      rethrow;
    }
  }
}
