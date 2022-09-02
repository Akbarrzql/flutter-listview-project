
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:listview_project/NewsApp/CovidPage/CovidModel.dart';

class CovidServices{
   final  baseUrl = "https://disease.sh/v3/covid-19/countries/id";

  Future getCovid() async {
    Uri urlApi = Uri.parse(baseUrl);

    final response = await http.get(urlApi);
    if (response.statusCode == 200) {
      return covidModelFromJson(response.body.toString());
    } else {
      throw Exception('Failed to load post');
    }
  }
}