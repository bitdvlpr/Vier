import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:Vier/screens/wallet_screen.dart';
import 'package:Vier/screens/profile_screen.dart';
import 'package:Vier/screens/storage_screen.dart';
import 'package:Vier/screens/home_screen.dart';



List<BottomNavigationBarItem> bottomnavitem = [
  BottomNavigationBarItem(
    icon: Icon(
      CupertinoIcons.home,
    ),
    title: Text(
      '',
    ),
  ),
  BottomNavigationBarItem(
    icon: Icon(
      CupertinoIcons.collections,
    ),
    title: Text(
      '',
    ),
  ),
  BottomNavigationBarItem(
    icon: Icon(
      CupertinoIcons.folder_open,
    ),
    title: Text(
      '',
    ),
  ),
  BottomNavigationBarItem(
    icon: Icon(
      CupertinoIcons.person,
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


//List Of Food Item For All ventures
const kAmala = 'Amala';
const kFufu = 'FuFu';
const kCowSkin = 'Cow Skin';
const kEefo = 'Eefo';
const kStew = 'Stew';
const kMeat = 'Meat';
const kFish = 'Fish';
const kFiredPlantain =  'Fried Plantian';
const kBoiledEgg = 'Boiled Egg';
const kSpahgetti = 'Spahgetti';
const kBeans = 'Beans';
const kWhiteRice = 'White Rice';
const kBread = 'Bread';
const kPureWater = 'Pure Water';
const kBottleWater ='Bottle Water';
const kPepsi = 'Pepsi Bottle Drink';
const kBigiCola = 'Bigi Cola Bottle Drink';
const kBigiLemon = 'Bigi Lemon Bottle Drink';
const kCocaCola = 'Coca Cola Bottle Drink';
const kSalad = 'Salad';
const kNoodles = 'Noodles';
const kChicken ='Chicken';
const kYam = 'Yam';
const kJollofRice = 'Jollof Rice';
const kFriedEgg = 'Fried Egg';
const kFriedRice = 'Fried Rice';
const kSuya = 'Suya';
const kSharwama ='Sharwama';
//End Of The List For Now