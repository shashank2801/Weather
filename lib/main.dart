import 'package:flutter/material.dart';
import 'package:weather/current/mainScreen.dart';
import 'package:weather/util/colors.dart';
import 'package:weather/weather_screen.dart';


void main() {
  runApp(MyApp());
}

ThemeData _weatherTheme(){
    final ThemeData base = ThemeData.fallback();

    return base.copyWith(
      brightness: Brightness.light
      // accentColor: primaryCyanA700,
      // primaryColor: primaryCyanDark,
      // hintColor: textonPrimaryBlack,
    );
  }


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: _weatherTheme(),
      debugShowCheckedModeBanner: false,
      home: WeatherApp(),
      );
  }
}

