import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var now = DateTime.now();
String getImage({String weatherDescription}){
  switch(weatherDescription){
      case "Clear":
        if(now.hour<20)
        {return "assets/sunnyVec.png";}
        else
        {return "assets/clearVec.png";}
        break;
      
      case "Clouds":
        {return "assets/cloudVec.png";}
        break;

      case "Rain":
        {return "assets/rainVec.png";}
        break;

      case "Snow":
        {return "assets/snowVec.png";}
        break;
      
      default:
        {return "assets/sunnyVec.png";}
        break;
    }
}