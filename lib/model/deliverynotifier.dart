

import 'package:flutter/material.dart';

class DeliveryNotifier with ChangeNotifier{
  bool _delivery=false;

  bool get delivery => _delivery;

   mdelivery(bool value) {
    _delivery = value;
    notifyListeners();
  }


}