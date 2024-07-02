import 'package:flutter/material.dart';
import 'package:flutter_application_1/weatherModel.dart';
import 'package:flutter_application_1/weatherService.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherService _weatherService = WeatherService();
  Weather? _weather;
  bool _loading = false;
  String? _error;

  Weather? get weather => _weather;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> fetchWeather(String cityName) async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      _weather = await _weatherService.fetchWeather(cityName);
    } catch (e) {
      _error = e.toString();
    }

    _loading = false;
    notifyListeners();
  }
}
