

import 'package:Vier/model/cafeteria.dart';
import 'package:flutter/foundation.dart';


class CafeteriaNotifier with ChangeNotifier{


  Map<Cafeteria,double> _iyadebocafeteria = {
    Cafeteria("images/bgr.PNG", "Amala",20.00):0.00,
    Cafeteria("images/bgr.PNG", "FuFu",20.00):0.00,
    Cafeteria("images/bgr.PNG", "Cow Skin",20.00):0.00,
    Cafeteria("images/bgr.PNG", "Eefo",0.02):0.00,
    Cafeteria("images/bgr.PNG", "Stew",0.02):0.00,
    Cafeteria("images/bgr.PNG", "Meat",50.00):0.00,
    Cafeteria("images/bgr.PNG", "Fish",100):0.00,
    Cafeteria("images/bgr.PNG", "Fried Plantian",10.00):0.00,
    Cafeteria("images/bgr.PNG", "Boiled Egg",50.00):0.00,
    Cafeteria("images/bgr.PNG", "Spahgetti",20.00):0.00,
    Cafeteria("images/bgr.PNG", "Beans",20.00):0.00,
    Cafeteria("images/bgr.PNG", "White Rice",20.00):0.00,
    Cafeteria("images/bgr.PNG", "Bread",70.00):0.00,
    Cafeteria("images/bgr.PNG", "Pure Water",10.00):0.00,
    Cafeteria("images/bgr.PNG", "Bottle Water",70.00):0.00,
    Cafeteria("images/bgr.PNG", "Pepsi Bottle Drink",100.00):0.00,
    Cafeteria("images/bgr.PNG", "Bigi Cola Bottle Drink",100.00):0.00,
    Cafeteria("images/bgr.PNG", "Bigi Lemon Bottle Drink",100.00):0.00,
    Cafeteria("images/bgr.PNG", "Coca Cola Bottle Drink",100.00):0.00,


  };


  Map<Cafeteria,double> _greencafeteria = {
    Cafeteria("images/snow", "Amala",20.00):0.00,
    Cafeteria("images/snow", "FuFu",20.00):0.00,
    Cafeteria("images/snow", "Cow Skin",20.00):0.00,
    Cafeteria("images/snow", "Eefo",0.02):0.00,
    Cafeteria("images/snow", "Stew",0.02):0.00,
    Cafeteria("images/snow", "Salad",100.00):0.00,
    Cafeteria("images/snow", "Noodles",80.00):0.00,
    Cafeteria("images/snow", "Chicken",150.00):0.00,
    Cafeteria("images/snow", "Spahgetti",20.00):0.00,
    Cafeteria("images/snow", "Meat",50.00):0.00,
    Cafeteria("images/snow", "Yam",20.00):0.00,
    Cafeteria("images/snow", "Fish",100):0.00,
    Cafeteria("images/snow", "Fried Plantian",10.00):0.00,
    Cafeteria("images/snow", "Fried Egg",50.00):0.00,
    Cafeteria("images/snow", "Boiled  Egg",50.00):0.00,
    Cafeteria("images/snow", "Fried Rice",10.00):0.00,
    Cafeteria("images/snow", "Jollof Rice",20.00):0.00,
    Cafeteria("images/snow", "Beans",20.00):0.00,
    Cafeteria("images/snow", "White Rice",20.00):0.00,
    Cafeteria("images/snow", "Pure Water",10.00):0.00,
    Cafeteria("images/snow", "Bottle Water",70.00):0.00,
    Cafeteria("images/snow", "Pepsi Bottle Drink",100.00):0.00,
    Cafeteria("images/snow", "Bigi Cola Bottle Drink",100.00):0.00,
    Cafeteria("images/snow", "Bigi Lemon Bottle Drink",100.00):0.00,
    Cafeteria("images/snow", "Coca Cola Bottle Drink",100.00):0.00,


  };


  Map<Cafeteria,double> _yellowcafeteria = {
    Cafeteria("images/snow", "White Rice",20.00):0.00,
    Cafeteria("images/snow", "Beans",20.00):0.00,
    Cafeteria("images/snow", "Jollof Rice",20.00):0.00,
    Cafeteria("images/snow", "Yam",20.00):0.00,
    Cafeteria("images/snow", "Pure Water",10.00):0.00,
    Cafeteria("images/snow", "Bottle Water",70.00):0.00,
    Cafeteria("images/snow", "Pepsi Bottle Drink",100.00):0.00,
    Cafeteria("images/snow", "Bigi Cola Bottle Drink",100.00):0.00,
    Cafeteria("images/snow", "Bigi Lemon Bottle Drink",100.00):0.00,
    Cafeteria("images/snow", "Coca Cola Bottle Drink",100.00):0.00,

  };


  Map<Cafeteria,double> _munchescafeteria = {
    Cafeteria("images/snow", "Fried Rice",10.00):0.00,
    Cafeteria("images/snow", "Chicken",150.00):0.00,
    Cafeteria("images/snow", "Jollof Rice",20.00):0.00,
    Cafeteria("images/snow", "Pure Water",10.00):0.00,
    Cafeteria("images/snow", "Bottle Water",70.00):0.00,
    Cafeteria("images/snow", "Pepsi Bottle Drink",100.00):0.00,
    Cafeteria("images/snow", "Bigi Cola Bottle Drink",100.00):0.00,
    Cafeteria("images/snow", "Bigi Lemon Bottle Drink",100.00):0.00,
    Cafeteria("images/snow", "Coca Cola Bottle Drink",100.00):0.00,

  };

  Map<Cafeteria,double> _fastfood = {
    Cafeteria("images/snow", "Suya",50.00):0.00,
    Cafeteria("images/snow", "Sharwama",500.00):0.00


  };

  Map<Cafeteria, double> get iyadebocafeteria => _iyadebocafeteria;

   iyadebo(int index,double newvalue) {
    _iyadebocafeteria.update(_iyadebocafeteria.keys.elementAt(index), (value)=> newvalue );
    notifyListeners();
  }


  Map<Cafeteria, double> get greencafeteria => _greencafeteria;
   greencorner(int index,double newvalue) {
     _greencafeteria.update(_greencafeteria.keys.elementAt(index), (value)=> newvalue );
   notifyListeners();
  }

  Map<Cafeteria, double> get yellowcafeteria => _yellowcafeteria;

   yellowcorner(int index,double newvalue) {
    _yellowcafeteria.update(_yellowcafeteria.keys.elementAt(index), (value)=> newvalue );
    notifyListeners();
  }

  Map<Cafeteria, double> get munchescafeteria => _munchescafeteria;

   munches(int index,double newvalue) {
    _munchescafeteria.update(_munchescafeteria.keys.elementAt(index), (value)=> newvalue );
    notifyListeners();
  }

  Map<Cafeteria, double> get fastfood => _fastfood;

   fastfoodventures(int index,double newvalue) {
    _fastfood.update(_fastfood.keys.elementAt(index), (value)=> newvalue );
    notifyListeners();
  }

  iyadebototal(){
    double total = 0;
     for(double value in _iyadebocafeteria.values){
       total +=value;
     }
     return total;
  }

  yellowtotal(){
    double total = 0;
    for(double value in _yellowcafeteria.values){
      total +=value;
    }
    return total;
  }


  greentotal(){
    double total = 0;
    for(double value in _greencafeteria.values){
      total +=value;
    }
    return total;
  }

  munchestotal(){
    double total = 0;
    for(double value in _munchescafeteria.values){
      total +=value;
    }
    return total;
  }


  fasttotal(){
    double total = 0;
    for(double value in _fastfood.values){
      total +=value;
    }
    return total;
  }


}