import 'dart:convert';
import 'package:swis_warehouse/data/Api/login_api.dart';
class LoginRepo {
   static Future login(String email,String password) async {
    try {

      var response = await LoginApi.loginAuth(email,password);
      if (response == null) {
        throw Exception('Login failed: No response from API');
      }
      return jsonDecode(response);
    } catch(error) {
      print('Error in repo: $error'); // Log the error for debugging

      throw Exception('error in repo');
    }
  }
}
