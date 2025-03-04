import 'dart:convert';
import 'package:swis_warehouse/data/Api/login_api.dart';

import '../Api/logOutapi.dart';
class LogoutRepo {
  static Future logout() async {
    try {

      var response = await LogoutApi.logout();
      if (response == null) {
        throw Exception('Logout failed: No response from API');
      }
      return jsonDecode(response);
    } catch(error) {
      print('Error in repo: $error'); // Log the error for debugging

      throw Exception('error in repo');
    }
  }
}
