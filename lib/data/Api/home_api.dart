import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swis_warehouse/constant_stuff/url.dart';

class HomeApi {
  static String? message;

  static Future Home() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      var response = await http.get(
        Uri.parse('$url/api/showWarehouseForKeeper'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${preferences.get('token')}'
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      print(e);
    }
  }
}
