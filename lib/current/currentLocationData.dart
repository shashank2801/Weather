import 'dart:convert';

import 'package:weather/model/weatherforecastModel.dart';
import 'package:weather/util/forecast_util.dart';
import 'package:http/http.dart';

class Network1{

  Future<WeatherForecastModel> getWeatherForecast({String latitude, String longitude}) async{
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast/daily?lat="+latitude+"&lon="+longitude+
    "&appid="+Util.appID+"&units=metric";

    final response = await get(Uri.encodeFull(finalUrl));

    if(response.statusCode == 200){
      return WeatherForecastModel.fromJson(json.decode(response.body));
    }
    else{
      print("Error: $response.statusCode");
    }
  }

}