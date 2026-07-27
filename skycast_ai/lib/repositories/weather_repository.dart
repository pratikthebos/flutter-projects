import '../models/air_quality_model.dart';
import '../models/forecast_model.dart';
import '../models/hourly_weather_model.dart';
import '../models/weather_model.dart';
import '../models/weekly_weather_model.dart';
import '../services/dummy_weather_service.dart';

class WeatherRepository {
  WeatherModel getCurrentWeather() {
    return DummyWeatherService.currentWeather;
  }

  List<HourlyWeatherModel> getHourlyWeather() {
    return DummyWeatherService.hourlyForecast;
  }

  List<WeeklyWeatherModel> getWeeklyWeather() {
    return DummyWeatherService.weeklyForecast;
  }

  AirQualityModel getAirQuality() {
    return DummyWeatherService.airQuality;
  }

  List<ForecastModel> getAiForecast() {
    return DummyWeatherService.aiForecast;
  }
}