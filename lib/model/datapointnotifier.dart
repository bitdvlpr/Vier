import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/foundation.dart';


class Datapoints with ChangeNotifier{
  List<DataPoint<dynamic>> _data = [
    DataPoint<double>(value: 10, xAxis: 0),
    DataPoint<double>(value: 130, xAxis: 5),
    DataPoint<double>(value: 50, xAxis: 10),
    DataPoint<double>(value: 150, xAxis: 15),
    DataPoint<double>(value: 75, xAxis: 20),
    DataPoint<double>(value: 0, xAxis: 25),
    DataPoint<double>(value: 5, xAxis: 30),
    DataPoint<double>(value: 45, xAxis: 35),
  ];


  List<double> _xvalue = [0, 5, 10, 15, 20, 25, 30, 35];

  List<DataPoint<dynamic>> get data => _data;

  mspent(double value,double xAxis) {
    _data.add(DataPoint<double>(value: value,xAxis: xAxis),);
    notifyListeners();
  }

  List<double> get xvalue => _xvalue;

  set mvalue (double value) {
    _xvalue.add(value);
    notifyListeners();
  }


}