import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:weather/model/weatherforecastModel.dart';
import 'package:weather/ui/new_ui/search_item.dart';
import 'package:weather/util/backgroundImage.dart';

import '../../mainScreen.dart';

Widget UIScreen(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var forecastList = snapshot.data.list;
  String asset = getImage(weatherDescription: forecastList[0].weather[0].main);
  var currentTemp = forecastList[0].temp.day.toStringAsFixed(0);
  String city = snapshot.data.city.name;
  return SafeArea(
    child: Scaffold(
      backgroundColor: Colors.teal,
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.navigation),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return CurrentLocationScreen();
                      },
                    ),
                  );
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width * .6,
                child: Text(
                  "Weather Forecast for $city",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return SearchScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   width: MediaQuery.of(context).size.width*.05,
              // ),
              Text(
                "$currentTemp",
                style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              Text(
                "\u2103",
                style: TextStyle(
                    fontSize: 65,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
              ),
              //  SizedBox(
              //   width: MediaQuery.of(context).size.width*.05,
              // ),
              Image(
                image: AssetImage(asset),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.height * 0.25,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Max. Temp. \n",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            snapshot.data.list[0].temp.max.toString() +
                                " \u2103",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Min. Temp. \n",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            snapshot.data.list[0].temp.min.toString() +
                                " \u2103",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Humidity",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      CircularPercentIndicator(
                        radius: 100.0,
                        lineWidth: 7.0,
                        animation: true,
                        center: Text(
                          snapshot.data.list[0].humidity.toString() + "%",
                          style: TextStyle(color: Colors.black),
                        ),
                        percent:
                            snapshot.data.list[0].humidity.toDouble() * 0.01,
                        progressColor: Colors.cyan,
                        circularStrokeCap: CircularStrokeCap.square,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Text("7 Days Weather Forecast"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 8.0,
                  ),
                  oneDayCard(snapshot, 0, context),
                  SizedBox(
                    width: 8.0,
                  ),
                  oneDayCard(snapshot, 1, context),
                  SizedBox(
                    width: 8.0,
                  ),
                  oneDayCard(snapshot, 2, context),
                  SizedBox(
                    width: 8.0,
                  ),
                  oneDayCard(snapshot, 3, context),
                  SizedBox(
                    width: 8.0,
                  ),
                  oneDayCard(snapshot, 4, context),
                  SizedBox(
                    width: 8.0,
                  ),
                  oneDayCard(snapshot, 5, context),
                  SizedBox(
                    width: 8.0,
                  ),
                  oneDayCard(snapshot, 6, context),
                  SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget oneDayCard(
    AsyncSnapshot<WeatherForecastModel> snapshot, int i, BuildContext context) {
  var forecastList = snapshot.data.list[i];
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))),
    width: MediaQuery.of(context).size.width * .30,
    height: MediaQuery.of(context).size.width * .30,
    child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * .04,
        ),
        Text(
          forecastList.temp.day.toString() + " \u2103",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * .01,
        ),
        Text(
          "Max:" + forecastList.temp.max.toStringAsFixed(0) + "\u2103",
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * .02,
        ),
        Text(
          "Min:" + forecastList.temp.min.toStringAsFixed(0) + "\u2103",
          style: TextStyle(color: Colors.black),
        ),
      ],
    ),
  );
}
