import 'package:flutter/material.dart';

import '../models/forecast_model.dart';
import '../models/weekly_weather_model.dart';
import '../repositories/weather_repository.dart';

class ForecastViewModel extends ChangeNotifier {
  final WeatherRepository _repository = WeatherRepository();

  late List<ForecastModel> predictions;
  late List<WeeklyWeatherModel> weekly;

  ForecastViewModel() {
    loadForecast();
  }

  void loadForecast() {
    predictions = _repository.getAiForecast();
    weekly = _repository.getWeeklyWeather();

    notifyListeners();
  }
}