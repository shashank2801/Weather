import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather/model/weatherforecastModel.dart';

import 'package:weather/network/currentLocation.dart';
import 'package:weather/network/currentLocationData.dart';
import 'package:weather/util/forecast_util.dart';


class CurrentLocationScreen extends StatefulWidget {
  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  Future<WeatherForecastModel> forecastObject;
  String lattitude,longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    forecastObject = Network1().getWeatherForecast(latitude: lattitude,longitude: longitude);
  }

  void getLocation() async{
    Location location = Location();
    await location.getCurrentLocation();
    lattitude = location.lattitude;
    longitude = location.longitude;

    getData();
  }

  void getData() async{
    Response response = await get("https://api.openweathermap.org/data/2.5/forecast/daily?lat="+lattitude+"&lon="+longitude+
    "&appid="+Util.appID+"&units=metric");
    forecastObject = Network1().getWeatherForecast(latitude: lattitude,longitude: longitude);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){}
              )
          ],
        ),
        body: Container(
          child: FutureBuilder(
            future: forecastObject,
            builder: (BuildContext context,AsyncSnapshot<WeatherForecastModel> snapshot){
              if(snapshot.hasData){
                var temp = snapshot.data.list[0].temp.day;
                return Container(
                  child: Column(
                    children: [
                      Text("$lattitude"),
                      Text("$longitude"),
                      Text("$temp",style: TextStyle(fontSize: 25),)
                    ],
                  ),
                );
              }
              else{
                return CircularProgressIndicator();
              }
            },

          ),
        ),
      ),
    );
  }
}