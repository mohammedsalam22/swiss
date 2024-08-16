import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swis_warehouse/constant_stuff/url.dart';

import '../../constant_stuff/Token.dart';

class LoginApi {
  static String? message;

  static Future loginAuth(String email, String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      var response = await http.post(
        Uri.parse('$url/api/login'),
        headers: {
          'Accept': 'application/json',
        },
        body: {'email': email, 'password': password},
      );
      print('error');

      print(response.body);
      if (response.statusCode == 200) {
        print('siiiii');
        var j = jsonDecode(response.body);
        Token.token = j["data"]["access_token"];
        Token.value = j["data"]["id"];
        preferences.setString('token',j["data"]["access_token"]);
        preferences.setInt('id',j["data"]["id"]);
        message = j["message"];
        return response.body;
      } else {
        if (response.body.isEmpty) {
          throw Exception('empty');
        }
        print('siiiiiii');
        return response.body;
      }
    } catch (error) {
      rethrow;
    }
  }
}
