import 'dart:convert';
import 'package:swis_warehouse/data/Api/login_api.dart';
class LoginRepo {
   static Future login(String email,String password) async {
    try {
      var response = await LoginApi.loginAuth(email,password);
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }
}
