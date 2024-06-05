import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swis_warehouse/constant_stuff/url.dart';
class HomeApi {
  static String? message;
  static Future Home() async {
    message = '';
    try {
      var response = await http.get(
        Uri.parse('$url/login'),
        headers: {
          'Accept': 'application/json',
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
