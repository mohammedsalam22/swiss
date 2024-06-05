import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swis_warehouse/constant_stuff/url.dart';

class RegisterApi {
  static String? message;

  static Future registerAuth(int phone, String name, String type) async {
    message = '';
    try {
      var response = await http.post(
        Uri.parse('$url/register'),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'phone': phone,
          'name': name,
          'type': type,
          "type": "user",
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
