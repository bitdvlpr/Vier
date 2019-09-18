import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants.dart';


class ProfileScreen extends StatefulWidget {
  static const id = 'profile_screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Container(
       child: SingleChildScrollView(
         child: Column(
           children: <Widget>[
             SizedBox(
               height: 10.0,
             ),

             Center(
               child: InkWell(
                 onTap: (){

                 },
                 child: CircleAvatar(
                   //AssetImage('images/bg.png')
                  radius: 60.0,
                   //child: CachedNetworkImage(imageUrl: null),
                 ),
               ),
             ),
             SizedBox(
               height: 20.0,
             ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.perm_identity,color: Colors.white,),
                     title: Text('Identification  Number',style: TextStyle(color: Colors.white,fontSize: 20),),
                     subtitle:Text(''),
                   ),

                  ListTile(
                    leading: Icon(Icons.my_location,color: Colors.white,),
                    title: Text('Location',style: TextStyle(color: Colors.white,fontSize: 20),),
                    subtitle:Text(''),
                  ),

                  ListTile(
                    leading: Icon(Icons.attach_money,color: Colors.white,),
                    title: Text('Amount',style: TextStyle(color: Colors.white,fontSize: 20),),
                    subtitle:Text(''),
                  ),

                  ListTile(
                    leading: Icon(Icons.message,color: Colors.white,),
                    title: Text('Send a Message',style: TextStyle(color: Colors.white,fontSize: 20),),
                    subtitle:Text(''),
                  ),

                ],
              ),


           ],
         ),
       ),
      ),
    );
  }
}
