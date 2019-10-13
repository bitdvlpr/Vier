
import 'package:Vier/model/cafeteria.dart';
import 'package:flutter/material.dart';

class ShowItemPickedNotifier with ChangeNotifier{


  Map<Cafeteria,double> _itempicked = Map<Cafeteria,double> ();


  Map<Cafeteria,double> get itempicked => _itempicked;

  additem(Cafeteria cafeteria,double value){

   _itempicked[cafeteria] = value;
    notifyListeners();
  }
}