import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var now = DateTime.now();
String getImage({String weatherDescription}){
  switch(weatherDescription){
      case "Clear":
        if(now.hour<20)
        {return "assets/sunny.jpg";}
        else
        {return "assets/clear.jpg";}
        break;
      
      case "Clouds":
        {return "assets/cloud.jpg";}
        break;

      case "Rain":
        {return "assets/rain.jpg";}
        break;

      case "Snow":
        {return "assets/snow.jpg";}
        break;
      
      default:
        {return "assets/sunny.jpg";}
        break;
    }
}