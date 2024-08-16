import 'dart:convert';

import '../Api/profile_api.dart';


class ProfileRepo {
  static Future profile(int id) async {
    try {
      var response = await ProfileApi.profile(id);
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }
}