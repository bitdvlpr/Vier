import 'package:Vier/screens/credit_card_screen.dart';
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Column(
        children: <Widget>[
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
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               Expanded(child: IconButton(icon: Icon(Icons.perm_identity),color: Colors.white, onPressed: () {
                 //TODO: Display email and encrypted group
                 //TODO: Level in app i.e premium , normal
               },)),

               Expanded(child: IconButton(icon: Icon(Icons.my_location,color: Colors.white,),onPressed: () {
                 //TODO: Know current location
               },)) ,

               Expanded(child: IconButton(icon: Icon(Icons.attach_money,color: Colors.white,),onPressed: () {
                 Navigator.push(context,  MaterialPageRoute(builder: (context)=> CreditCard()));
               },)) ,

               Expanded(child: IconButton(icon: Icon(Icons.message,color: Colors.white,),onPressed: () {

                 //TODO: Add API for cloudsms to send message
               },)) ,

               //TODO: Enter credit card details and click go
               //TODO: I want to make sure i save the details to a sharedpreferences
             ],
           ),
        ],
      ),
    );
  }
}
