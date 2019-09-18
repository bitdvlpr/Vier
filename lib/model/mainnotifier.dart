import 'package:flutter/foundation.dart';


class HomeNotifier with ChangeNotifier{
  int _selectedindex =0;
  bool _wait1 = true ;
  bool _wait2 = false ;
  bool _wait3 = false ;
  bool _wait4 = false ;

  int get selectedindex => _selectedindex;

  set selectedindex(int value) {
    _selectedindex = value;
    notifyListeners();
  }

  bool get wait1 => _wait1;

  set wait1(bool value) {
    _wait1 = value;
    notifyListeners();
  }

  bool get wait4 => _wait4;

  set wait4(bool value) {
    _wait4 = value;
    notifyListeners();
  }

  bool get wait3 => _wait3;

  set wait3(bool value) {
    _wait3 = value;
    notifyListeners();
  }

  bool get wait2 => _wait2;

  set wait2(bool value) {
    _wait2 = value;
    notifyListeners();
  }


  ghj(bool jnj){
    
  }
}