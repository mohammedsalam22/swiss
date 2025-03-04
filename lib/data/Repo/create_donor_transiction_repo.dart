import 'dart:convert';

import 'package:swis_warehouse/data/Api/create_transiction.dart';

import '../../ui/screens/LabelPage/sending_label/donor_view.dart';
import '../Api/create_donor_transiction.dart';

class CreateDonorTransictionRepo {
  static Future createTransiction(Map data) async {
    try {
      print('dsd') ;
      var response = await CreateDonorTransictionApi.createTransiction(data);
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }
}