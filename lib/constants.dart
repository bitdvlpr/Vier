import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:Vier/screens/wallet_screen.dart';
import 'package:Vier/screens/profile_screen.dart';
import 'package:Vier/screens/storage_screen.dart';
import 'package:Vier/screens/home_screen.dart';



List<BottomNavigationBarItem> bottomnavitem = [
  BottomNavigationBarItem(
    icon: GestureDetector(
      child: Icon(
        MaterialCommunityIcons.home_outline,
      ),
    ),
    title: Text(
      '',
    ),
  ),
  BottomNavigationBarItem(
    icon: GestureDetector(
      child: Icon(
        MaterialCommunityIcons.camera_enhance_outline,
      ),
    ),
    title: Text(
      '',
    ),
  ),
  BottomNavigationBarItem(
    icon: GestureDetector(
      child: Icon(
        Icons.person_outline,
      ),
    ),
    title: Text(
      '',
    ),
  ),
];

List<Widget> widgetOptions = <Widget>[
  HomeScreen(),
  WalletScreen(),
  StorageScreen(),
  ProfileScreen(),
];

const kTextFieldDecoration = InputDecoration(
 // fillColor: Colors.white,
  filled: true,
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: kMainColor,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(20.0),),
    ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: kMainColor,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(20.0),),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: kMainColor,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(20.0),),
  ),

);

const kGoogleMapAPIKey = 'AIzaSyAGIwUpG6Aht41Ck3nBiEy20nkvpJ_vyqY';

const kBackgroundScaffold = Color(0xffffffff);  //0xff232d37
const kMainColor = Color(0xff232D37);


//TODO: for android dropdown menu item , dont forget fam  =====DONE
const List<String> picker = [
  'Food',
  'Message',
  'Family',
  'Work',
  'Love',
  'Chores',
  'Vital details',
];



