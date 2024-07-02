import 'package:flutter/material.dart';
import 'package:flutter_application_1/weatherModel.dart';
import 'package:flutter_application_1/weatherPage.dart';
import 'package:flutter_application_1/weatherService.dart';
import 'package:flutter_application_1/weather_Provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
