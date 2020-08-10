import 'package:flutter/material.dart';
import 'package:weather/mainScreen.dart';
import 'package:weather/util/colors.dart';

void main() {
  runApp(MyApp());
}

ThemeData _weatherTheme(){
    final ThemeData base = ThemeData.fallback();

    return base.copyWith(
      brightness: Brightness.light,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 14,
         // color: textonSecondaryWhite,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: _weatherTheme(),
      debugShowCheckedModeBanner: false,
      home: CurrentLocationScreen(),
      );
  }
}

