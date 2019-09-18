import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:Vier/services/location.dart';
import 'dart:async';
import 'package:Vier/screens/main_screen.dart';

class LocationMap extends StatefulWidget {
  static const id = 'location_screen';

  final lat;
  final long;

  LocationMap({this.lat,this.long});

  @override
  _LocationMapState createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {

   CameraPosition _exactlocation;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //getCurrentLocation();
    _goToTheLake();
    updatemap(widget.lat, widget.long);
    print(widget.lat);
    print(widget.long);
  }




  Completer<GoogleMapController> _controller = Completer();

  void updatemap(dynamic latit,dynamic longti) {

    setState(() {
      _exactlocation = CameraPosition(
         // bearing: 192.8334901395799,
          target: LatLng(latit, longti),
          //tilt: 59.440717697143555,
          zoom: 15.0);
    });

  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_exactlocation));

  }

  Set<Marker> _markers(){

    return <Marker>[
      Marker(
          markerId: MarkerId('Current Location'),
        position: LatLng(widget.lat, widget.long),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: 'Home',),
      ),
    ].toSet();
  }


  @override
  Widget build(BuildContext context) {
    //Note we use WillPopScope like onBackPressed in android
    return WillPopScope(
      child: Material(
        child: Container(
            child: SafeArea(
                child: Stack(
                  children: <Widget>[
                    GoogleMap(
                      markers: _markers(),
                      initialCameraPosition: _exactlocation,
                      mapType: MapType.normal,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back,color: Color(0xFFFF897B),),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context,MainPage.id);
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                         children: <Widget>[
                            RawMaterialButton(onPressed: (){

                            },
                              child: IconButton(
                                icon: Icon(Icons.add,color: Colors.white,),
                                onPressed: () {

                                  //This takes you to another page where we have list of cities or places in that state
                                },
                              ),
                              elevation: 6.0,
                              constraints: BoxConstraints.tightFor(
                                width: 60.0,
                                height: 60.0,
                              ),
                              fillColor: Color(0xFFFF897B),
                              shape: CircleBorder(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
      ), onWillPop: () {
      Navigator.pushReplacementNamed(context,MainPage.id);
    },
    );

  }





}
