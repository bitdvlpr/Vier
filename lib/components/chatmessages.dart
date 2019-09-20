import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ChatMessage extends StatelessWidget {

  final DocumentSnapshot documentSnapshot;
  final String loggedinuser;


  ChatMessage({@required this.documentSnapshot,@required this.loggedinuser});


  Widget TextImageDisplay(BuildContext context){

    switch(documentSnapshot['id']){
      case 0:
        return Material(
          elevation: 4.0,
          color: loggedinuser==documentSnapshot['sender'] ? Colors.lightBlueAccent : Colors.white,
          borderRadius: loggedinuser==documentSnapshot['sender'] ?  BorderRadius.only(
            topLeft: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ) : BorderRadius.only(
            topRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
          child:  Padding(
            padding:  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Text(
              documentSnapshot['msgimg']??' ',
              style: TextStyle(
              color: loggedinuser==documentSnapshot['sender'] ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
        break;
      case 1:
        return Container(
          width: MediaQuery.of(context).size.width/3,
          height: MediaQuery.of(context).size.height/4,
          decoration: BoxDecoration(
            color: loggedinuser==documentSnapshot['sender'] ? Colors.lightBlueAccent : Colors.white,
            borderRadius: loggedinuser==documentSnapshot['sender'] ?  BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ) : BorderRadius.only(
              topRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),

          ),
          child:  Padding(
            padding:  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: CachedNetworkImage(
              imageUrl: documentSnapshot.data['msgimg'],
              placeholder: (context, url) => new CupertinoActivityIndicator(animating: true, radius: 10.0,),
              errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
            ),
        );
    }
  }

  String timestamp(){
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(documentSnapshot['timestamp'] );
    var formatter = new DateFormat('h:mm a dd-MM-yyyy');
    String formatted = formatter.format(date);
    print(formatted);

    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: loggedinuser==documentSnapshot['sender'] ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            documentSnapshot['sender'] ?? ' ',
            style: TextStyle(color: Colors.grey, fontSize: 10.0),
          ),
          TextImageDisplay(context),
          Text(
            timestamp() ?? ' ',
            style: TextStyle(color: Colors.grey, fontSize: 10.0),
          ),
        ],

      ),
    );
  }
}
