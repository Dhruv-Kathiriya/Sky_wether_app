import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../Modal/wethermodals.dart';

class ApiHelper {
  ApiHelper._();

  static ApiHelper apiHelper = ApiHelper._();
  Future<Weather?> weatherApiHelper({required String city}) async {
    log("Code is started...");
    Uri url = Uri.parse(
        "http://api.weatherapi.com/v1/forecast.json?key=ae0969987ba5420182354730242211&q=$city&aqi=no");

    http.Response res = await http.get(url);

    log("Response code : ${res.statusCode}");

    if (res.statusCode == 200) {
      log("If is run....");
      Map<String, dynamic> allWeatherData = jsonDecode(res.body);
      Weather weather = Weather.formMap(data: allWeatherData);
      return weather;
    }
    return null;
  }
}
