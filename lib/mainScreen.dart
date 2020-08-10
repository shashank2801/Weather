import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather/current/currentLocation.dart';
import 'package:weather/model/weatherforecastModel.dart';


import 'package:weather/network/currentLocationNetwork.dart';
import 'package:weather/ui/new_ui/main_screen_ui.dart';

class CurrentLocationScreen extends StatefulWidget {
  @override
  CurrentLocationScreenState createState() => CurrentLocationScreenState();
}

class CurrentLocationScreenState extends State<CurrentLocationScreen> {
  Future<WeatherForecastModel> forecastObjects;
  String lattitude, longitude;

  @override
  void initState() {
    super.initState();
    getLocationAndModel();
    // forecastObjects = Network1()
    //     .getWeatherForecast(latitude: lattitude, longitude: longitude);
    // print("Post call 0");
  }

  void getLocationAndModel() async {
    Location location = Location();
    await location.getCurrentLocation();

    lattitude = location.lattitude;
    longitude = location.longitude;

    setState(() {
      lattitude = location.lattitude;
      longitude = location.longitude;
    });
    
   // print(lattitude + "\n" + longitude);
    
    forecastObjects = Network1()
        .getWeatherForecast(latitude: lattitude, longitude: longitude);
  
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: FutureBuilder(
            future: forecastObjects,
            builder: (BuildContext context,
                AsyncSnapshot<WeatherForecastModel> snapshot) {
              if (snapshot.hasData) {
                return UIScreen(snapshot, context);
              } else {
                return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Please wait while Weather Conditions are being Updated..."),
                        CircularProgressIndicator(),
                      ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
