
import 'package:flutter/material.dart';

class LocationNotifier with ChangeNotifier{
  double _latitude;
  double _longitude;

  double get latitude => _latitude;

   mlatitude(double value) {
    _latitude = value;
    notifyListeners();
  }

  double get longitude => _longitude;

   mlongitude(double value) {
    _longitude = value;
    notifyListeners();
  }


}