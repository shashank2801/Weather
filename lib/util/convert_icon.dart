import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

var now = DateTime.now();
Widget getWeatherIcon({String weatherDescription, double size}){

    switch(weatherDescription){
      case "Clear":
        if(now.hour<20)
        {return Icon(FontAwesomeIcons.sun, color: Colors.yellow, size: size);}
        else
        {return Icon(FontAwesomeIcons.moon, color: Colors.blueGrey[300], size: size,);}
        break;
      
      case "Clouds":
        {return Icon(FontAwesomeIcons.cloud, color: Colors.blueGrey[300], size: size,);}
        break;

      case "Rain":
        {return Icon(FontAwesomeIcons.cloudRain, color: Colors.blueGrey[300], size: size,);}
        break;

      case "Snow":
        {return Icon(FontAwesomeIcons.snowflake, size: size,);}
        break;
      
      default:
        {return Icon(FontAwesomeIcons.sun, color: Colors.yellow, size: size);}
        break;
    }
}