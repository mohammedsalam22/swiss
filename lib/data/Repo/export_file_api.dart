import 'dart:convert';
import 'package:swis_warehouse/data/Api/inventory_api.dart';
import 'package:swis_warehouse/data/Api/login_api.dart';

import '../Api/export_file_api.dart';
import '../Api/material_api.dart';
class ExportFileRepo {
  static Future export(String Firstdate,String LastDate) async {
    try {
      var response = await ExportFileApi.export(Firstdate,LastDate);
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }

  static Future download(String url) async {
    try {
      var response = await ExportFileApi.downloadFile(url);
      return response;
    } catch(error) {
      throw Exception('error in repo');
    }
  }

  static Future getAll() async {
    try {
      var response = await ExportFileApi.getAllFile();
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }

  static Future search(String data) async {
    try {
      var response = await ExportFileApi.search(data);
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }

}
