import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:swis_warehouse/constant_stuff/url.dart';

class MaterialApi {
  static String? message;

  static Future material() async {
    final FlutterSecureStorage secureStorage = FlutterSecureStorage();

    try {
      var response = await http.get(
        Uri.parse('$url/api/indexItemForKeeper'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authentication': 'Bearer ${await secureStorage.read(key: 'token')} '
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        var j = jsonDecode(response.body);
        print(response.body);
        message = j["message"];
        throw Exception('error occurred');
      } else {
        if (response.body.isEmpty) {
          throw Exception('empty');
        }
        print('siiiiiii');
        return response.body;
      }
    } catch (error) {
      rethrow;
    }
  }
}
