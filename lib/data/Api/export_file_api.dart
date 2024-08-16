
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swis_warehouse/constant_stuff/url.dart';


class ExportFileApi {
  static String? message;

  static Future export(String Firstdate,String LastDate) async {
    // final FlutterSecureStorage secureStorage = FlutterSecureStorage();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print(Firstdate) ;
    try {
      var response = await http.get(
        Uri.parse('$url/api/exportInventory?start_date=$Firstdate&end_date=$LastDate'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${preferences.get('token')}'
        },

      );
      print(response.body) ;
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      print(e);
    }
  }

  static Future downloadFile(String url1) async {
    print('dfd') ;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      var response = await http.post(
        Uri.parse('$url/api/files/downloader'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${preferences.get('token')}'
        },
        body: {
          'url' : url1,
        }
      );
      print(response.body) ;
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      print(e);
    }
  }

  static Future getAllFile() async {
    // final FlutterSecureStorage secureStorage = FlutterSecureStorage();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      var response = await http.get(
        Uri.parse('$url/api/keeper/files'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${preferences.get('token')}'
        },
      );
      print(response.body) ;
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      print(e);
    }
  }

  static Future search(String data) async {
    // final FlutterSecureStorage secureStorage = FlutterSecureStorage();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      var response = await http.get(
        Uri.parse('$url/api/search/searchitems?query=$data'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${preferences.get('token')}'
        },
      );
      print(response.body) ;
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      print(e);
    }
  }
}
