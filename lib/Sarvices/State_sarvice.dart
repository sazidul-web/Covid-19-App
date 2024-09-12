import 'dart:convert';

import 'package:covid_19_api_project/Model/WordCovidAPI.dart';
import 'package:http/http.dart' as http;

import 'Utilits/App_Url.dart';

class StateSarvice {
  Future<WorldCovidAPI> Covid19api() async {
    final responce = await http.get(Uri.parse(CovidAPi.baseUrlall));
    if (responce.statusCode == 200) {
      var data = jsonDecode(responce.body);
      return WorldCovidAPI.fromJson(data);
    } else {
      throw Exception('Erorr');
    }
  }

  Future<List<dynamic>> CountriesList() async {
    final responce = await http.get(Uri.parse(CovidAPi.baseUrlCountry));
    var data;
    if (responce.statusCode == 200) {
      data = jsonDecode(responce.body);
      return data;
    } else {
      throw Exception('Erorr');
    }
  }
}
