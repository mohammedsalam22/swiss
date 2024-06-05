import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swis_warehouse/constant_stuff/url.dart';

class ForgetPasswordApi {
  static String? message;

  static Future forgetPassword(String email) async {
    message = '';
    try {
      var response = await http.post(
        Uri.parse('$url/forgetpassword'),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'email': email,
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

class RetrivePasswordApi {
  static String? message;

  static Future retrivePassword(int code) async {
    message = '';
    try {
      var response = await http.post(
        Uri.parse('$url/forgetpassword'),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'code': code,
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
