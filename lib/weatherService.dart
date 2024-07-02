import 'dart:convert';
import 'package:flutter_application_1/weatherModel.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '42fd844028b7613e92d09c0ea33018ef';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Weather> fetchWeather(String cityName) async {
    final response = await http.get(
      Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
