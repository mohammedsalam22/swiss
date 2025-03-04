import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swis_warehouse/constant_stuff/url.dart';

import '../../constant_stuff/Token.dart';

class LogoutApi {
  static String? message;

  static Future logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    try {
      var response = await http.post(
        Uri.parse('$url/api/logout'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${preferences.get('token')}'
        } );

      if (response.statusCode == 200) {
        // Logout successful
        print('Logout successful: ${response.body}');
      } else {
        // Handle error
        print('Logout failed: ${response.statusCode} - ${response.body}');
      }
    } catch (error) {
      // Handle network error
      print('Error occurred: $error');
    }
  }
}
