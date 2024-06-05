import 'dart:convert';

import 'package:swis_warehouse/data/Api/forget_password_api.dart';

class ForgetPasswordRepo {
  Future forget(String email) async {
    try {
      var response = await ForgetPasswordApi.forgetPassword(email);
      return jsonDecode(response);
    } catch (error) {
      throw Exception('error in repo');
    }
  }
}

class RetrivePasswordRepo {
  Future retrive(int code) async {
    try {
      var response = await RetrivePasswordApi.retrivePassword(code);
      return jsonDecode(response);
    } catch (error) {
      throw Exception('error in repo');
    }
  }
}
