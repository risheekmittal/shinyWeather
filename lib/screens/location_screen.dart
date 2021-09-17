import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/services.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  double temperature;
  int temp;
  Widget weatherIcon;
  String weatherTxt;
  String city;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  void updateUI( dynamic weatherData){
    temperature = weatherData['main']['temp'];
    temp = temperature.toInt();
    var condition = weatherData['weather'][0]['id'];
    weatherIcon = weather.getWeatherIcon(condition);
    weatherTxt = weather.getMessage(temp);
    city = weatherData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/${weather.weatherText}'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 200.0),
                  child: Column(
                    children: <Widget>[
                      weatherIcon,
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: Text(
                          '$temp°',
                          style: kTempTextStyle,
                        ),
                      ),
              SizedBox(height: 100.0,),
              Padding(
                        padding: EdgeInsets.only(right: 15.0,),
                        child: Text(
                          weatherTxt,
                          textAlign: TextAlign.center,
                          style: kMessageTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
