import 'package:flutter/material.dart';

import '../models/weather_model.dart';
import '../models/hourly_weather_model.dart';
import '../models/air_quality_model.dart';
import '../repositories/weather_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final WeatherRepository _repository = WeatherRepository();

  late WeatherModel weather;
  late List<HourlyWeatherModel> hourly;
  late AirQualityModel airQuality;

  HomeViewModel() {
    loadData();
  }

  void loadData() {
    weather = _repository.getCurrentWeather();
    hourly = _repository.getHourlyWeather();
    airQuality = _repository.getAirQuality();

    notifyListeners();
  }
}