import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swis_warehouse/constant_stuff/url.dart';

import '../../constant_stuff/Token.dart';

class TransictionStatusApi {
  static String? message;

  static Future transiction() async {
    // final FlutterSecureStorage secureStorage = FlutterSecureStorage();
    SharedPreferences preferences = await SharedPreferences.getInstance();

    try {
      var response = await http.get(
        Uri.parse('$url/api/indexTransactionForKeeper'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${preferences.get('token')}'
        },
      );
      if (response.statusCode == 200) {
        print(response.body);
        return response.body;
      }
    } catch (error) {
      rethrow;
    }
  }

  static Future transictionCalled(String url) async {
    // final FlutterSecureStorage secureStorage = FlutterSecureStorage();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${preferences.get('token')}'
        },
      );
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (error) {
      rethrow;
    }
  }
}
