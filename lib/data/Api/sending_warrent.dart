import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swis_warehouse/constant_stuff/url.dart';

class SendWarrentApi {
  static String? message;

  static Future sendWarrent(
      String warrentName,
      int warrentNum,
      int wieght,
      String date,
      String name,
      String companyName,
      int driverId,
      String details) async {
    message = '';
    try {
      var response = await http.post(
        Uri.parse('$url/send'),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'warrentName': warrentName,
          'warrentNum': warrentNum,
          'wieght': wieght,
          'date': date,
          'name': name,
          'companyName': companyName,
          'driverId': driverId,
          'details': details
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
