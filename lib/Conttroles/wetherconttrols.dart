import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/Helper/api_helper.dart';

import '../Modal/wethermodals.dart';

class WeatherConttrols extends ChangeNotifier {
  String city = "London";

  Future<Weather?> fetchWeatherData() async {
    return await ApiHelper.apiHelper.weatherApiHelper(city: city);
  }
}
