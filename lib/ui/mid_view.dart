import 'package:flutter/material.dart';
import 'package:weather/model/weatherforecastModel.dart';
import 'package:weather/util/colors.dart';
import 'package:weather/util/convert_icon.dart';
import 'package:weather/util/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot){
  var forecastList = snapshot.data.list;
  var formattedDate = new DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          Text("${snapshot.data.city.name},${snapshot.data.city.country}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.0
          ),),
          SizedBox(height:6.0,),
          Text("${Util.getFormattedDate(formattedDate)}"),
          SizedBox(height:16.0),
          getWeatherIcon(weatherDescription: forecastList[0].weather[0].main, size: 195.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${forecastList[0].temp.day.toStringAsFixed(0)}°C  ",style: TextStyle(fontSize: 34.0),),
                Text("${forecastList[0].weather[0].description.toUpperCase()}"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("${forecastList[0].speed.toDouble()} miles/h"),
                    Icon(FontAwesomeIcons.wind, size: 20.0, color: primaryCyanA700,)
                  ],
                ),
                SizedBox(width: 10.0,),
                Column(
                  children: [
                    Text("${forecastList[0].humidity.toStringAsFixed(0)}%"),
                    Icon(FontAwesomeIcons.tint,size: 20.0, color: primaryCyanA700)
                  ],
                ),
                SizedBox(width: 10.0,),
                Column(
                  children: [
                    Text("${forecastList[0].temp.max} °C"),
                    Icon(FontAwesomeIcons.thermometerFull,size: 20.0,color: primaryCyanA700)
                  ],
                ),
              ],
            )
          )
        ],
      ),
    ),
  );

  return midView;
}