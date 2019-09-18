/*
import 'package:flutter/material.dart';

class  extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<> {
  @override
  Widget build(BuildContext context) {
    return Container(
    child:  Stack(
    children: <Widget>[
    Container(
    margin: EdgeInsets.only(
    top: 60.0,
    ),
    decoration: ShapeDecoration(
    color: Color(0xFFFFFFFF),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(40.0),
    topRight: Radius.circular(40.0)),
    ),
    ),
    width: double.infinity,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Text('Binar',style: TextStyle(fontFamily: 'Pacifico',fontSize: 30.0,),textAlign: TextAlign.center,),
Padding(
padding: EdgeInsets.only(
top: 0.0, bottom: 30.0, left: 20.0, right: 20.0),
child: TextField(
keyboardType: TextInputType.emailAddress,
decoration: kTextFieldDecoration.copyWith(
labelText: 'Email',
labelStyle: TextStyle(color:  Color(0xFF353759)),
icon: Icon(
MaterialCommunityIcons.email_outline,
color:  Color(0xFF353759),
),
),
),
),
Padding(
padding: EdgeInsets.only(left: 20.0, right: 20.0),
child: TextField(

keyboardType: TextInputType.text,
decoration: kTextFieldDecoration.copyWith(
labelText: 'Password',
labelStyle: TextStyle(color:  Color(0xFF353759)),
icon: Icon(
Icons.lock_outline,
color: Color(0xFF353759),
),
),
),
),
Padding(
padding: EdgeInsets.only(top: 30.0),
child: RaisedButton(
padding: EdgeInsets.only(
left: 70.0, right: 70.0, top: 15.0, bottom: 15.0),
color: Color(0xFFFF897B),
onPressed: () {
Navigator.pushReplacementNamed(context, HomePage.id);
},
child: Text('Sign in',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.only(
topLeft: Radius.circular(30.0),
topRight: Radius.circular(30.0),
bottomLeft: Radius.circular(30.0),
bottomRight: Radius.circular(30.0),
),
),
elevation: 0.0,
),
),
Flexible(
child: Container(
margin: EdgeInsets.only(top: 20.0,),
child: Text('Register',style: TextStyle(fontSize: 15.0),)),
),
],
),
),
],
),,
    );
  }
}
*/
