import 'package:flutter/material.dart';

import '../core/constants/app_icons.dart';
import '../models/air_quality_model.dart';
import '../models/forecast_model.dart';
import '../models/hourly_weather_model.dart';
import '../models/weather_model.dart';
import '../models/weekly_weather_model.dart';

class DummyWeatherService {
  DummyWeatherService._();

  /// Current Weather
  static const WeatherModel currentWeather = WeatherModel(
    city: "Mumbai",
    condition: "Partly Cloudy",
    temperature: 29,
    feelsLike: 33,
    humidity: 78,
    windSpeed: 18,
    uvIndex: 7,
    airQuality: 52,
    sunrise: "06:18 AM",
    sunset: "07:12 PM",
    icon: AppIcons.cloudy,
    color: Colors.orange,
  );

  /// Hourly Forecast
  static const List<HourlyWeatherModel> hourlyForecast = [
    HourlyWeatherModel(
      time: "09 AM",
      temperature: 29,
      icon: AppIcons.sunny,
      color: Colors.amber,
    ),
    HourlyWeatherModel(
      time: "12 PM",
      temperature: 31,
      icon: AppIcons.sunny,
      color: Colors.orange,
    ),
    HourlyWeatherModel(
      time: "03 PM",
      temperature: 32,
      icon: AppIcons.cloudy,
      color: Colors.blue,
    ),
    HourlyWeatherModel(
      time: "06 PM",
      temperature: 28,
      icon: AppIcons.rainy,
      color: Colors.lightBlue,
    ),
    HourlyWeatherModel(
      time: "09 PM",
      temperature: 27,
      icon: AppIcons.moon,
      color: Colors.indigo,
    ),
  ];

  /// Weekly Forecast
  static const List<WeeklyWeatherModel> weeklyForecast = [
    WeeklyWeatherModel(
      day: "Mon",
      condition: "Sunny",
      highTemp: 31,
      lowTemp: 26,
      icon: AppIcons.sunny,
      color: Colors.amber,
    ),
    WeeklyWeatherModel(
      day: "Tue",
      condition: "Cloudy",
      highTemp: 30,
      lowTemp: 25,
      icon: AppIcons.cloudy,
      color: Colors.blueGrey,
    ),
    WeeklyWeatherModel(
      day: "Wed",
      condition: "Rain",
      highTemp: 28,
      lowTemp: 24,
      icon: AppIcons.rainy,
      color: Colors.lightBlue,
    ),
    WeeklyWeatherModel(
      day: "Thu",
      condition: "Storm",
      highTemp: 27,
      lowTemp: 23,
      icon: AppIcons.thunder,
      color: Colors.deepPurple,
    ),
    WeeklyWeatherModel(
      day: "Fri",
      condition: "Sunny",
      highTemp: 32,
      lowTemp: 26,
      icon: AppIcons.sunny,
      color: Colors.orange,
    ),
    WeeklyWeatherModel(
      day: "Sat",
      condition: "Rain",
      highTemp: 29,
      lowTemp: 24,
      icon: AppIcons.rainy,
      color: Colors.blue,
    ),
    WeeklyWeatherModel(
      day: "Sun",
      condition: "Cloudy",
      highTemp: 30,
      lowTemp: 25,
      icon: AppIcons.cloudy,
      color: Colors.grey,
    ),
  ];

  /// Air Quality
  static const AirQualityModel airQuality = AirQualityModel(
    aqi: 52,
    level: "Good",
    description: "Air quality is suitable for outdoor activities.",
  );

  /// AI Weather Insights
  static const List<ForecastModel> aiForecast = [
    ForecastModel(
      title: "Rain Probability",
      value: "82%",
    ),
    ForecastModel(
      title: "Carry Umbrella",
      value: "Yes",
    ),
    ForecastModel(
      title: "Outdoor Activity",
      value: "Best before 9 AM",
    ),
    ForecastModel(
      title: "Heat Index",
      value: "34°C",
    ),
    ForecastModel(
      title: "Travel Advice",
      value: "Traffic may increase due to evening showers.",
    ),
    ForecastModel(
      title: "Best Time",
      value: "07:00 AM - 10:00 AM",
    ),
  ];
}