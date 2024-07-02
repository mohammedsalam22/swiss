import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swis_warehouse/constant_stuff/url.dart';

class LoginApi {
  static String? message;

 static Future loginAuth(String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse('$url/api/login'),
        headers: {
          'Accept': 'application/json' ,
        },
        body: {
          'email': email,
          'password': password
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
        print('siiiiiii');
        return response.body;
      }
    } catch (error) {
      rethrow;
    }
  }
}
