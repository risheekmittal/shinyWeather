import 'package:flutter/cupertino.dart';


class WeatherModel {
  String weatherText;
  Widget getWeatherIcon(int condition) {
    if (condition < 300) {
      weatherText = 'thunderbg.jpg';
      return Image(image: AssetImage('images/thunder.png'),width: 150.0,);
    } else if (condition < 400) {
      weatherText = 'drizzlebg.jpg';
      return Image(image: AssetImage('images/drizzle.png'),width: 150.0,);
    } else if (condition < 600) {
      weatherText = 'rainybg.jpg';
      return Image(image: AssetImage('images/rainy.png'),width: 150.0,);
    } else if (condition < 700) {
      weatherText = 'snowbg.png';
      return Image(image: AssetImage('images/snow.png'),width: 150.0,);
    } else if (condition < 800) {
      weatherText = 'windybg.png';
      return Image(image: AssetImage('images/wind.png'),width: 150.0,);
    } else if (condition == 800) {
      weatherText = 'clearbg.jpg';
      return Image(image: AssetImage('images/clear.png'),width: 150.0,);
    } else if (condition <= 804) {
      weatherText = 'cloudybg.jpg';
      return Image(image: AssetImage('images/cloudy.png'),width: 150.0,);
    } else {
      weatherText = 'clear2bg.png';
      return Image(image: AssetImage('images/clear.png'),width: 150.0,);
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
