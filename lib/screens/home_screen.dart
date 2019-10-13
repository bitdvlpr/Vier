import 'package:Vier/model/locationnotifier.dart';
import 'package:Vier/api/services/location.dart';
import 'package:Vier/api/services/weatherapiclient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Vier/model/weather.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

final _newsfire = Firestore.instance;
class HomeScreen extends StatefulWidget {
  static const id = "home_screen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  WeatherApi weatherApi = WeatherApi();

  Future<void> getLocationpoint() async{

    double lat;
    double long;
    WeatherApi weatherApi = WeatherApi();


    Location location = Location();
    await location.getLocation();


    final locationnotify = Provider.of<LocationNotifier>(context);

    lat = location.latitude;
    locationnotify.mlatitude(lat);
    long = location.longtitude;
    locationnotify.mlongitude(long);

    weatherApi.getweather(latitude: lat,longitude: long);
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationpoint();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<LocationNotifier>(
      builder: (BuildContext context, locationnotify, _) => Padding(
        padding: const EdgeInsets.only(bottom:50.0),
        child: ListView(
          children: <Widget> [
            FutureBuilder<Weather>(
              future: weatherApi.getweather(latitude: locationnotify.latitude,longitude: locationnotify.longitude),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return (!snapshot.hasData)
                        ? CupertinoActivityIndicator(
                      animating: true,
                      radius: 10.0,
                    )
                        : Text(
                      "Hello World",
                      style: TextStyle(color: Colors.transparent),
                    );
                    break;
                  default:
                    return (snapshot.hasData) ? weatherdisplay(context, snapshot) : CupertinoActivityIndicator(
                      //TODO: Change this to a searching network gif
                      animating: true,
                      radius: 10.0,
                    );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'News',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  )),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: _newsfire.collection('NewsRunner').orderBy('timestamp',descending: true).snapshots(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return (!snapshot.hasData)
                          ? CupertinoActivityIndicator(
                              animating: true,
                              radius: 10.0,
                            )
                          : Text(
                              "Hello World",
                              style: TextStyle(color: Colors.transparent),
                            );
                      break;
                    default:
                      return ListView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: snapshot.data.documents.length,
                         itemBuilder: (BuildContext context, int index)
                         {

                           return NewTiles(documentSnapshot: snapshot.data.documents[index],);
                           },
                        shrinkWrap: true,
                      );
                  }
                }),
        ]
        ),
      ),
    );
  }
}

class NewTiles extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  NewTiles({@required this.documentSnapshot});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0),),
      ),
      elevation: 0.0,
      child: GestureDetector(
        onTap: () async{
          if(await canLaunch(documentSnapshot['url'])){
            await launch(documentSnapshot['urll']);
          }else{
            throw 'Cloud not launch url';
          }
        },
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.all_inclusive,),
            ],
          ),
          title: Text(
            documentSnapshot['title'],
            style: TextStyle(
              fontSize: 15,
            ),
            maxLines: 1,
          ),
          subtitle: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                '${documentSnapshot['story']}...Read More',
                style: TextStyle(
                  fontSize: 12,
                ),
                maxLines: 2,
              ),
              Text(
                documentSnapshot['timestamp'],
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
          //trailing: , TODO: comment feature later upgrade
        ),
      ),
    );
  }
}


Widget weatherdisplay (BuildContext context,AsyncSnapshot<Weather> snapshot){

  Weather weather = Weather();


  var weatherresult;
  double temp;
  var ic;
  int tempe;
  if (snapshot.hasData) {
    weatherresult =   snapshot.data.toJson();

    print(weatherresult);

    var icons = weatherresult['weather'];
    var main = weatherresult['main'];
    temp = main['temp'] ?? 0;
    print(temp);
     tempe = temp.toInt() ?? 0;

    for (var icon in icons) {
      ic = icon['icon'];
      print(ic);
    }
  }


  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      image: DecorationImage(
        image: AssetImage('images/bgr.PNG'),
      ),

    ),
    height: MediaQuery.of(context).size.height/3,
    width: MediaQuery.of(context).size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            weather.weathertemperature(context, '$ic' ?? ''),
            Text(
              '${tempe ?? 0}° ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 60.0,
                fontFamily: 'SourceSansPro',),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    ),
  );

}