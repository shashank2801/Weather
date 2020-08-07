import 'package:flutter/material.dart';
import 'package:weather/model/weatherforecastModel.dart';
import 'package:weather/util/colors.dart';

import 'forecast_card.dart';

Widget bottomViewB(AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context){
  var forecastList = snapshot.data.list;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text("7-Day Weather Forecast".toUpperCase(),style: TextStyle(fontSize: 14.0, color: Colors.black87),),
      Container(
        height: 170.0,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          
          itemBuilder: (context, index)=> ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Container(
              width: MediaQuery.of(context).size.width/2,
              height: 160.0,
              child: forecastCard(snapshot,index),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [secondaryGreenDark,secondaryGreenLight], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
            ),
          ),
          separatorBuilder: (context, index)=> SizedBox(width: 8.0), 
          itemCount: forecastList.length,
          ),
      )

  ],);
}