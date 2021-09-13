import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '83281e6be4272ae696bc98b543368a1d';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState(){
    super.initState();
    getLocationData();
  }

  void getLocationData() async{
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper helper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await helper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(locationWeather: weatherData,)));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: const SpinKitSquareCircle(color: Color(0xFF082554)),
      ),
    );
  }
}
