import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swis_warehouse/constant_stuff/url.dart';

class RegisterApi {
  static String? message;

  static Future registerAuth(String name,String phone, String password, String password_confirmation) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    message = '';
    try {
      var response = await http.post(
        Uri.parse('$url/api/complete-profile'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${preferences.get('token')}'
        },
        body: {
          'name[en]': name,
          'phone': phone,
          'password': password,
          'password_confirmation': password_confirmation,
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        var j = jsonDecode(response.body);
        preferences.setString('token', j["data"]["access_token"]);
        preferences.setInt('id', j["data"]["id"]);
        preferences.setInt('first_login', j["data"]["first_login"]);
        preferences.setInt('type', j["data"]["type"]);
        message = j["message"];
      } else {
        throw Exception('an error happened');
      }
    } catch (error) {
      rethrow;
    }
  }
}
