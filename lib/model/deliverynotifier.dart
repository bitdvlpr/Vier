

import 'package:flutter/material.dart';

class DeliveryNotifier with ChangeNotifier{
  Map<int,bool> _delivery = {
    0:false,
    1:false,
    2:false,
    3:false,
    4:false,
  };



 delivery(int index) => _delivery.values.elementAt(index);

  mdelivery(int index,bool value) {
    _delivery.update(index, (val)=>value);
    notifyListeners();
  }


}