import 'package:flutter/material.dart';
import 'package:weather/model/weatherforecastModel.dart';
import 'package:weather/network/searchedLocationNetwork.dart';
import 'package:weather/util/forecast_util.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _cityName = ".";
  Future<WeatherForecastModel> forecastObjects;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple[400],
        body: ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .01),
            Center(child: Text("Weather",style: TextStyle(fontSize: 30,fontFamily: 'Pacifico'),)),
            SizedBox(height: MediaQuery.of(context).size.height * .04),
            textField(),
            SizedBox(height: MediaQuery.of(context).size.height * .11),
            _cityName == "."
                ? Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(70),
                        ),),
                    height: MediaQuery.of(context).size.height * .66,
                  )
                : bottomSheet(),
          ],
        ),
      ),
    );
  }

  Widget textField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
     // height: MediaQuery.of(context).size.height*.1,
      child: Center(
        child: TextField(
          style: TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            hintText: "Enter City Name",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: EdgeInsets.all(8.0),
          ),
          onSubmitted: (value) {
            setState(
              () {
                _cityName = value;
                forecastObjects =
                    new Network().getWeatherForecast(cityName: _cityName);
              },
            );
          },
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(70))),
      height: MediaQuery.of(context).size.height * .66,
      child: Column(children: [
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "7 Day Weather Conditions for: ",
              style: TextStyle(color: Colors.black, fontSize: 16,),
            ),
            Text(
              _cityName,
              style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        FutureBuilder(
          future: forecastObjects,
          builder: (BuildContext context,
              AsyncSnapshot<WeatherForecastModel> snapshot) {
            if (snapshot.hasData) {
              return forecastSheet(snapshot);
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ]),
    );
  }

  Widget forecastSheet(AsyncSnapshot snapshot) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            width: 8.0,
          ),
          oneDayCard(snapshot, 0),
          SizedBox(
            width: 8.0,
          ),
          oneDayCard(snapshot, 1),
          SizedBox(
            width: 8.0,
          ),
          oneDayCard(snapshot, 2),
          SizedBox(
            width: 8.0,
          ),
          oneDayCard(snapshot, 3),
          SizedBox(
            width: 8.0,
          ),
          oneDayCard(snapshot, 4),
          SizedBox(
            width: 8.0,
          ),
          oneDayCard(snapshot, 5),
          SizedBox(
            width: 8.0,
          ),
          oneDayCard(snapshot, 6),
          SizedBox(
            width: 8.0,
          ),
        ],
      ),
    );
  }

  Widget oneDayCard(AsyncSnapshot snapshot, int i) {
    var forecastList = snapshot.data.list[i];
    var formattedDate =
        new DateTime.fromMillisecondsSinceEpoch(forecastList.dt * 1000);
    return Container(
      height: MediaQuery.of(context).size.height * 0.53,
      width: MediaQuery.of(context).size.width * .30,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.purple[300], Color(0xffEA90FC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Date",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("${Util.getFormattedDate(formattedDate)}",style: TextStyle(fontSize: 14),),
          SizedBox(height: 20),
          Text(
            "Temp",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            forecastList.temp.day.toString() + "\u2103",
          ),
          SizedBox(height: 20),
          Text(
            "Max",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            forecastList.temp.max.toString() + "\u2103",
          ),
          SizedBox(height: 20),
          Text(
            "Min",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            forecastList.temp.min.toString() + "\u2103",
          ),
          SizedBox(height: 20),
          Text(
            "Humidity",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            forecastList.humidity.toString() + "%",
          ),
        ],
      ),
    );
  }
}
