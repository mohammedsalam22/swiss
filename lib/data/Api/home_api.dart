import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swis_warehouse/constant_stuff/url.dart';
class HomeApi {
  static String? message;

  static Future Home() async {
    final FlutterSecureStorage secureStorage = FlutterSecureStorage();

    message = '';
    try {
      var response = await http.get(
        Uri.parse('$url/'),
        headers: {
          'Accept': 'application/json',
          'Authintication': 'Bearer ${await secureStorage.read(key: 'token')} ',
        },
      );
      print(response.body);
      if (response.statusCode != 200) {
        var j = jsonDecode(response.body);
        message = j["message"];
        throw Exception('error occurred');
      } else {
        if (response.body.isEmpty) {
          throw Exception('empty');
        }
        return response.body;
      }
    } catch (error) {
      rethrow;
    }
  }
}
