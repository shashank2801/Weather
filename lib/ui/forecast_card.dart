import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/model/weatherforecastModel.dart';
import 'package:weather/util/colors.dart';
import 'package:weather/util/convert_icon.dart';
import 'package:weather/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index){
  var forecastList = snapshot.data.list;
  var dayOfWeek = "";
  var fullDate = Util.getFormattedDate(new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000));
  dayOfWeek = fullDate.split(",")[0];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("$dayOfWeek", style: TextStyle(fontWeight: FontWeight.bold),),
      )),
      Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 33.0,
          child: getWeatherIcon(weatherDescription: forecastList[index].weather[0].main, size: 25.0),
        ),
        SizedBox(width: 5.0,),
        Column(
          children: [
            Row(
              children: [
                Icon(FontAwesomeIcons.temperatureHigh, color: primaryCyanDark,),
                SizedBox(width: 5.0,),
                Text("${forecastList[index].temp.max}°C"),
      
              ],
              ),
            Row(
              children: [
                Icon(FontAwesomeIcons.temperatureLow, color: primaryCyanDark),
                SizedBox(width: 5.0,),
                Text("${forecastList[index].temp.min}°C"),
              ],
              ),
            Row(
              children: [
                Icon(FontAwesomeIcons.tint, color: primaryCyanDark),
                SizedBox(width: 5.0,),
                Text("${forecastList[index].humidity} %"),
              ],
              ),
          ],
        )
      ],
    )

    ],
  );
}