import 'package:flutter/material.dart';
import 'package:weather/model/weatherforecastModel.dart';
import 'package:weather/network/network.dart';
import 'package:weather/ui/bottom_view.dart';
import 'package:weather/ui/mid_view.dart';
import 'package:weather/util/backgroundImage.dart';
import 'package:weather/util/colors.dart';

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  Future<WeatherForecastModel> forecastObjects;
  String _cityName = "Meerut";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObjects = Network().getWeatherForecast(cityName: _cityName);

  }
  @override
  String asset="assets/sunny.jpg";
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xff424242),
          ),
          child:ListView(
          children: <Widget>[
            SizedBox(height: 10.0,),
            textFieldView(),
            Container(
              child: FutureBuilder(
                future: forecastObjects,
                builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot){

                  if(snapshot.hasData){
                    asset = getImage(weatherDescription: snapshot.data.list[0].weather[0].main);
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("$asset"),fit: BoxFit.cover
                        ),
                      ),
                      child:Column(
                          children: <Widget>[
                            midView(snapshot),
                            SizedBox(height: 60.0,),
                            Divider(height: 5.0,),
                            bottomViewB(snapshot, context),
                          ],),
                    );
                  }
                  else{
                    return CircularProgressIndicator();
                  }
                }
              )
            ),
                      
                    ],
                  ),),
                ),
    );
            }
          
           Widget textFieldView() {
             return Container(
               child: TextField(
                 decoration: InputDecoration(
                   hintText: "Enter City Name",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: EdgeInsets.all(8.0),
                 ),
                  onSubmitted: (value){
                    setState(() {
                      _cityName = value;
                      forecastObjects = new Network().getWeatherForecast(cityName: _cityName);
                    });
                  },
               )
             );
           }
}
