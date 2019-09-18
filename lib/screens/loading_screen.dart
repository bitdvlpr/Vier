import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:Vier/services/location.dart';
import 'dart:async';
import 'package:Vier/screens/location_screen.dart';
import 'package:flutter/cupertino.dart';


class LoadingScreen extends StatefulWidget {
  static const id = 'loading_screen';


  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {



  double lat;
  double long;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //getCurrentLocation();
    getLocationpoint();
  }

//
//  Future<void> getCurrentLocation() async {
//    Location location = Location();
//    await location.getLocation();
//
//      lat = location.latitude;
//      print(lat);
//      long = location.longtitude;
//      print(long);
//
//
//
//
//
//  }

  Future<void> getLocationpoint() async{

    Location location = Location();
    await location.getLocation();

    setState(() {

      lat = location.latitude;
      print(lat);
      long = location.longtitude;
      print(long);

    });


  }




  @override
  Widget build(BuildContext context) {
    return  (lat==null && long==null) ? SpinCenter() : LocationMap(lat: lat,long: long,);
  }
}

class SpinCenter extends StatelessWidget {
  const SpinCenter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      child: Center(
        child: CupertinoActivityIndicator(
          animating: true,
          radius: 40.0,
        ),
      ),
    );
  }
}

/*
* SpinKitCircle(
        color: Color(0xFFFF897B),
        size: 100.0,
      )*/