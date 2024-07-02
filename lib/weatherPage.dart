import 'package:flutter/material.dart';
import 'package:flutter_application_1/weather_Provider.dart';
import 'package:flutter_application_1/weather_detail.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter City Name',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  Provider.of<WeatherProvider>(context, listen: false)
                      .fetchWeather(_controller.text)
                      .then((_) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WeatherDetailsScreen(),
                      ),
                    );
                  });
                }
              },
              child: const Text('Get Weather'),
            ),
            Consumer<WeatherProvider>(
              builder: (context, weatherProvider, child) {
                if (weatherProvider.loading) {
                  return const CircularProgressIndicator();
                } else if (weatherProvider.error != null) {
                  return Text(weatherProvider.error!);
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
