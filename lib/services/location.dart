
import 'package:geolocator/geolocator.dart';

class Location {

  int latitude;
  int longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude.round();
      longitude = position.longitude.round();
    }
    catch(e){
      print(e);
    }
  }
}