import 'package:flutter/material.dart';
import 'package:flutter_application_1/weather_Provider.dart';
import 'package:provider/provider.dart';

class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              weatherProvider.fetchWeather(weatherProvider.weather!.cityName);
            },
          ),
        ],
      ),
      body: weatherProvider.weather == null
          ? const Center(child: Text('No data'))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    weatherProvider.weather!.cityName,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${weatherProvider.weather!.temperature} °C',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Image.network(
                    'http://openweathermap.org/img/wn/${weatherProvider.weather!.icon}.png',
                    scale: 0.5,
                  ),
                  Text(
                    weatherProvider.weather!.weatherCondition,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Text('Humidity: ${weatherProvider.weather!.humidity}%'),
                  const SizedBox(height: 10),
                  Text('Wind Speed: ${weatherProvider.weather!.windSpeed} m/s'),
                ],
              ),
            ),
    );
  }
}
