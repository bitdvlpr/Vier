import 'package:geolocator/geolocator.dart';

class Location {
double latitude;
double longtitude;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      print(latitude);
      longtitude = position.longitude;
      print(longtitude);
    }catch(e){
      print(e);
    }

  }


}
