import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swis_warehouse/constant_stuff/url.dart';

class TransictionInfoApi {
  static String? message;

  static Future transictionInfo(int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    try {
      var response = await http.get(
        Uri.parse('$url/api/showTransactionForKeeper/$id'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${preferences.get('token')}'
        },
      );
      if (response.statusCode == 200) {
        print('salalalalala');
        return response.body;
      }
    } catch (error) {
      rethrow;
    }
  }
}
