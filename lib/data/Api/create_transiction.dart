import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swis_warehouse/constant_stuff/url.dart';

class CreateTransictionApi {
  static Future sendWarrent(Map data) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      print('sds') ;
      print(data) ;
      var response = await http.post(
        Uri.parse('$url/api/transactions'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${preferences.get('token')}'
        },
        body: data,
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body ;
      }
    } catch (error) {
      rethrow;
    }
  }
}
