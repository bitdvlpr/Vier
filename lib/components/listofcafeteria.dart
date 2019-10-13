import 'dart:math';
import 'package:Vier/components/cafeteriafooditemtemplate.dart';
import 'package:Vier/components/fooditemlisttile.dart';
import 'package:Vier/components/showcafeteriafoooditemselected.dart';
import 'package:Vier/constants.dart';
import 'package:Vier/model/cafeteria.dart';
import 'package:Vier/model/cafeterianotifier.dart';
import 'package:Vier/model/deliverynotifier.dart';
import 'package:Vier/model/showitempickednotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllCafeteria extends StatefulWidget {
  @override
  _AllCafeteriaState createState() => _AllCafeteriaState();
}

class _AllCafeteriaState extends State<AllCafeteria> {

  @override
  Widget build(BuildContext context) {
    return Consumer<CafeteriaNotifier>(
      builder: (context, notifier, _) {
        final delivery = Provider.of<DeliveryNotifier>(context);
        return ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CafeteriaFoodItemList(
            cafe: 'IYA DEBO',
            performdelivery: (value) {
              delivery.mdelivery(0, value);
            },
            delivery: delivery.delivery(0),
            lenghtvalue: notifier.iyadebocafeteria.length,
            total: notifier.iyadebototal(),
            itemBuild: (BuildContext context, int index) => FoodItem(
              foodimage:
                  notifier.iyadebocafeteria.keys.elementAt(index).foodimage,
              foodtype:
                  notifier.iyadebocafeteria.keys.elementAt(index).foodname,
              price: notifier.iyadebocafeteria.values.elementAt(index),
              removenotifier: () {
                switch (
                    notifier.iyadebocafeteria.keys.elementAt(index).foodname) {
                  case kAmala:
                  case kFufu:
                  case kCowSkin:
                  case kBeans:
                  case kWhiteRice:
                  case kSpahgetti:
                    double value =
                        notifier.iyadebocafeteria.values.elementAt(index);
                    notifier.iyadebocafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.iyadebo(index, value -= 20.00);
                    break;

                  case kEefo:
                  case kStew:
                    int decimal = 2;
                    int fac = pow(10,decimal);
                    double value =
                        notifier.iyadebocafeteria.values.elementAt(index);
                    value=(value * fac).round()/fac;
                    notifier.iyadebocafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.iyadebo(index, value -= 0.02);
                    break;
                  case kMeat:
                  case kBoiledEgg:
                    double value =
                        notifier.iyadebocafeteria.values.elementAt(index);
                    notifier.iyadebocafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.iyadebo(index, value -= 50.00);
                    break;

                  case kFish:
                  case kPepsi:
                  case kBigiCola:
                  case kBigiLemon:
                  case kCocaCola:
                    double value =
                        notifier.iyadebocafeteria.values.elementAt(index);
                    notifier.iyadebocafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.iyadebo(index, value -= 100.00);
                    break;

                  case kFiredPlantain:
                  case kPureWater:
                    double value =
                        notifier.iyadebocafeteria.values.elementAt(index);
                    notifier.iyadebocafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.iyadebo(index, value -= 10.00);
                    break;

                  case kBread:
                  case kBottleWater:
                    double value =
                        notifier.iyadebocafeteria.values.elementAt(index);
                    notifier.iyadebocafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.iyadebo(index, value -= 70.00);

                    break;
                }
              },
              addnotifier: () {
                switch (
                    notifier.iyadebocafeteria.keys.elementAt(index).foodname) {
                  case kAmala:
                  case kFufu:
                  case kCowSkin:
                  case kBeans:
                  case kWhiteRice:
                  case kSpahgetti:
                    double value =
                        notifier.iyadebocafeteria.values.elementAt(index);
                    notifier.iyadebocafeteria.values.elementAt(index) == 0.00
                        ? notifier.iyadebo(index, value += 20.00)
                        : notifier.iyadebo(index, value += 20.00);
                    break;

                  case kEefo:
                  case kStew:
                  int decimal = 2;
                  int fac = pow(10,decimal);
                   double value =
                        notifier.iyadebocafeteria.values.elementAt(index);
                  value=(value * fac).round()/fac;
                  notifier.iyadebocafeteria.values.elementAt(index) == 0.00
                        ? notifier.iyadebo(index, value += 0.02)
                        : notifier.iyadebo(index, value += 0.02);
                    break;
                  case kMeat:
                  case kBoiledEgg:
                    double value =
                        notifier.iyadebocafeteria.values.elementAt(index);
                    notifier.iyadebocafeteria.values.elementAt(index) == 0.00
                        ? notifier.iyadebo(index, value += 50.00)
                        : notifier.iyadebo(index, value += 50.00);
                    break;

                  case kFish:
                  case kPepsi:
                  case kBigiCola:
                  case kBigiLemon:
                  case kCocaCola:
                    double value =
                        notifier.iyadebocafeteria.values.elementAt(index);
                    notifier.iyadebocafeteria.values.elementAt(index) == 0.00
                        ? notifier.iyadebo(index, value += 100.00)
                        : notifier.iyadebo(index, value += 100.00);
                    break;

                  case kFiredPlantain:
                  case kPureWater:
                    double value =
                        notifier.iyadebocafeteria.values.elementAt(index);
                    notifier.iyadebocafeteria.values.elementAt(index) == 0.00
                        ? notifier.iyadebo(index, value += 10.00)
                        : notifier.iyadebo(index, value += 10.00);
                    break;

                  case kBread:
                  case kBottleWater:
                    double value =
                        notifier.iyadebocafeteria.values.elementAt(index);
                    notifier.iyadebocafeteria.values.elementAt(index) == 0.00
                        ? notifier.iyadebo(index, value += 70.00)
                        : notifier.iyadebo(index, value += 70.00);

                    break;
                }
              },
            ),
            mcontinue: () async{
              final item = Provider.of<ShowItemPickedNotifier>(context);
               await notifier.iyadebocafeteria
                  .forEach((keys, value) {
                    if(value>0.0) {
                        item.additem(
                            Cafeteria(keys.foodimage, keys.foodname, 0.00),
                            value);
                    }
                  });

              if(delivery.delivery(0)==true){
                item.additem(
                    Cafeteria("images/dkd", "Delivery", 0.00),
                    50.00);
              }
              notifier.iyadebototal()==0.00 ?
                  null:
             showfooditem();
            },
          ),
          CafeteriaFoodItemList(
            cafe: 'GREEN CORNER',
            performdelivery: (value) {
              delivery.mdelivery(1, value);
            },
            delivery: delivery.delivery(1),
            lenghtvalue: notifier.greencafeteria.length,
            total: notifier.greentotal(),
            itemBuild: (BuildContext context, int index) => FoodItem(
              foodimage:
                  notifier.greencafeteria.keys.elementAt(index).foodimage,
              foodtype: notifier.greencafeteria.keys.elementAt(index).foodname,
              price: notifier.greencafeteria.values.elementAt(index),
              removenotifier: () {
                switch (notifier.greencafeteria.keys.elementAt(index).foodname) {
                  case kAmala:
                  case kFufu:
                  case kCowSkin:
                  case kBeans:
                  case kFriedRice:
                  case kJollofRice:
                  case kYam:
                  case kWhiteRice:
                  case kSpahgetti:
                    double value =
                    notifier.greencafeteria.values.elementAt(index);
                    notifier.greencafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.greencorner(index, value -= 20.00);
                    break;

                  case kEefo:
                  case kStew:
                    int decimal = 2;
                    int fac = pow(10,decimal);
                    double value =
                    notifier.greencafeteria.values.elementAt(index);
                    value=(value * fac).round()/fac;
                    notifier.greencafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.greencorner(index, value -= 0.02);
                    break;
                  case kMeat:
                  case kFriedEgg:
                  case kBoiledEgg:
                    double value =
                    notifier.greencafeteria.values.elementAt(index);
                    notifier.greencafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.greencorner(index, value -= 50.00);
                    break;

                  case kFish:
                  case kPepsi:
                  case kSalad:
                  case kBigiCola:
                  case kBigiLemon:
                  case kCocaCola:
                    double value =
                    notifier.greencafeteria.values.elementAt(index);
                    notifier.greencafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.greencorner(index, value -= 100.00);
                    break;

                  case kFiredPlantain:
                  case kPureWater:
                    double value =
                    notifier.greencafeteria.values.elementAt(index);
                    notifier.greencafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.greencorner(index, value -= 10.00);
                    break;

                  case kBread:
                  case kBottleWater:
                    double value =
                    notifier.greencafeteria.values.elementAt(index);
                    notifier.greencafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.greencorner(index, value -= 70.00);

                    break;
                  case kNoodles:
                    double value =
                    notifier.greencafeteria.values.elementAt(index);
                    notifier.greencafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.greencorner(index, value -= 80.00);

                    break;
                  case kChicken:
                    double value =
                    notifier.greencafeteria.values.elementAt(index);
                    notifier.greencafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.greencorner(index, value -= 150.00);

                    break;
                }

              },
              addnotifier: () {
                switch (
                notifier.greencafeteria.keys.elementAt(index).foodname) {
                  case kAmala:
                  case kFufu:
                  case kCowSkin:
                  case kBeans:
                  case kFriedRice:
                  case kJollofRice:
                  case kYam:
                  case kWhiteRice:
                  case kSpahgetti:
                    double value =
                    notifier.greencafeteria.values.elementAt(index);
                    notifier.greencafeteria.values.elementAt(index) == 0.00
                        ? notifier.greencorner(index, value += 20.00)
                        : notifier.greencorner(index, value += 20.00);
                    break;

                  case kEefo:
                  case kStew:
                    int decimal = 2;
                    int fac = pow(10,decimal);
                    double value =
                    notifier.greencafeteria.values.elementAt(index);
                    value=(value * fac).round()/fac;
                    notifier.greencafeteria.values.elementAt(index) == 0.00
                        ? notifier.greencorner(index, value += 0.02)
                        : notifier.greencorner(index, value += 0.02);
                    break;
                  case kMeat:
                  case kFriedEgg:
                  case kBoiledEgg:
                    double value =
                    notifier.greencafeteria.values.elementAt(index);
                    notifier.greencafeteria.values.elementAt(index) == 0.00
                        ? notifier.greencorner(index, value += 50.00)
                        : notifier.greencorner(index, value += 50.00);
                    break;

                  case kFish:
                  case kPepsi:
                  case kSalad:
                  case kBigiCola:
                  case kBigiLemon:
                  case kCocaCola:
                    double value =
                    notifier.greencafeteria.values.elementAt(index);
                    notifier.greencafeteria.values.elementAt(index) == 0.00
                        ? notifier.greencorner(index, value += 100.00)
                        : notifier.greencorner(index, value += 100.00);
                    break;

                  case kFiredPlantain:
                  case kPureWater:
                    double value =
                    notifier.greencafeteria.values.elementAt(index);
                    notifier.greencafeteria.values.elementAt(index) == 0.00
                        ? notifier.greencorner(index, value -= 10.00)
                        : notifier.greencorner(index, value -= 10.00);
                    break;

                  case kBread:
                  case kBottleWater:
                    double value =
                    notifier.greencafeteria.values.elementAt(index);
                    notifier.greencafeteria.values.elementAt(index) == 0.00
                        ? notifier.greencorner(index, value += 70.00)
                        : notifier.greencorner(index, value += 70.00);

                    break;
                  case kNoodles:
                    double value =
                    notifier.greencafeteria.values.elementAt(index);
                    notifier.greencafeteria.values.elementAt(index) == 0.00
                        ? notifier.greencorner(index, value += 80.00)
                        : notifier.greencorner(index, value += 80.00);

                    break;
                  case kChicken:
                    double value =
                    notifier.greencafeteria.values.elementAt(index);
                    notifier.greencafeteria.values.elementAt(index) == 0.00
                        ? notifier.greencorner(index, value += 150.00)
                        : notifier.greencorner(index, value += 150.00);

                    break;
                }
              },
            ),
            mcontinue: () async{
              final item = Provider.of<ShowItemPickedNotifier>(context);
              await notifier.greencafeteria
                  .forEach((keys, value) {
                if(value>0.0) {
                  item.additem(
                      Cafeteria(keys.foodimage, keys.foodname, 0.00),
                      value);
                }
              });

              if(delivery.delivery(1)==true){
                item.additem(
                    Cafeteria("images/dkd", "Delivery", 0.00),
                    50.00);
              }
              notifier.greentotal()==0.00 ?
              null:
              showfooditem();
            },
          ),
          CafeteriaFoodItemList(
            cafe: 'YELLOW CORNER',
            performdelivery: (value) {
              delivery.mdelivery(2, value);
            },
            delivery: delivery.delivery(2),
            lenghtvalue: notifier.yellowcafeteria.length,
            total: notifier.yellowtotal(),
            itemBuild: (BuildContext context, int index) => FoodItem(
              foodimage:
                  notifier.yellowcafeteria.keys.elementAt(index).foodimage,
              foodtype: notifier.yellowcafeteria.keys.elementAt(index).foodname,
              price: notifier.yellowcafeteria.values.elementAt(index),
              removenotifier: () {
                switch (
                notifier.yellowcafeteria.keys.elementAt(index).foodname) {
                  case kAmala:
                  case kFufu:
                  case kCowSkin:
                  case kBeans:
                  case kFriedRice:
                  case kJollofRice:
                  case kYam:
                  case kWhiteRice:
                  case kSpahgetti:
                    double value =
                    notifier.yellowcafeteria.values.elementAt(index);
                    notifier.yellowcafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.yellowcorner(index, value -= 20.00);
                    break;

                  case kEefo:
                  case kStew:
                    int decimal = 2;
                    int fac = pow(10,decimal);
                    double value =
                    notifier.yellowcafeteria.values.elementAt(index);
                    value=(value * fac).round()/fac;
                    notifier.yellowcafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.yellowcorner(index, value -= 0.02);
                    break;
                  case kMeat:
                  case kFriedEgg:
                  case kBoiledEgg:
                    double value =
                    notifier.yellowcafeteria.values.elementAt(index);
                    notifier.yellowcafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.yellowcorner(index, value -= 50.00);
                    break;

                  case kFish:
                  case kPepsi:
                  case kSalad:
                  case kBigiCola:
                  case kBigiLemon:
                  case kCocaCola:
                    double value =
                    notifier.yellowcafeteria.values.elementAt(index);
                    notifier.yellowcafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.yellowcorner(index, value -= 100.00);
                    break;

                  case kFiredPlantain:
                  case kPureWater:
                    double value =
                    notifier.yellowcafeteria.values.elementAt(index);
                    notifier.yellowcafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.yellowcorner(index, value -= 10.00);
                    break;

                  case kBread:
                  case kBottleWater:
                    double value =
                    notifier.yellowcafeteria.values.elementAt(index);
                    notifier.yellowcafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.yellowcorner(index, value -= 70.00);

                    break;
                  case kNoodles:
                    double value =
                    notifier.yellowcafeteria.values.elementAt(index);
                    notifier.yellowcafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.yellowcorner(index, value -= 80.00);

                    break;
                  case kChicken:
                    double value =
                    notifier.yellowcafeteria.values.elementAt(index);
                    notifier.yellowcafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.yellowcorner(index, value -= 150.00);

                    break;
                }
              },
              addnotifier: () {
                switch (
                notifier.yellowcafeteria.keys.elementAt(index).foodname) {
                  case kAmala:
                  case kFufu:
                  case kCowSkin:
                  case kBeans:
                  case kFriedRice:
                  case kJollofRice:
                  case kYam:
                  case kWhiteRice:
                  case kSpahgetti:
                    double value =
                    notifier.yellowcafeteria.values.elementAt(index);
                    notifier.yellowcafeteria.values.elementAt(index) == 0.00
                        ? notifier.yellowcorner(index, value += 20.00)
                        : notifier.yellowcorner(index, value += 20.00);
                    break;

                  case kEefo:
                  case kStew:
                    int decimal = 2;
                    int fac = pow(10,decimal);
                    double value =
                    notifier.yellowcafeteria.values.elementAt(index);
                    value=(value * fac).round()/fac;
                    notifier.yellowcafeteria.values.elementAt(index) == 0.00
                        ? notifier.yellowcorner(index, value += 0.02)
                        : notifier.yellowcorner(index, value += 0.02);
                    break;
                  case kMeat:
                  case kFriedEgg:
                  case kBoiledEgg:
                    double value =
                    notifier.yellowcafeteria.values.elementAt(index);
                    notifier.yellowcafeteria.values.elementAt(index) == 0.00
                        ? notifier.yellowcorner(index, value += 50.00)
                        : notifier.yellowcorner(index, value += 50.00);
                    break;

                  case kFish:
                  case kPepsi:
                  case kSalad:
                  case kBigiCola:
                  case kBigiLemon:
                  case kCocaCola:
                    double value =
                    notifier.yellowcafeteria.values.elementAt(index);
                    notifier.yellowcafeteria.values.elementAt(index) == 0.00
                        ? notifier.yellowcorner(index, value += 100.00)
                        : notifier.yellowcorner(index, value += 100.00);
                    break;

                  case kFiredPlantain:
                  case kPureWater:
                    double value =
                    notifier.yellowcafeteria.values.elementAt(index);
                    notifier.yellowcafeteria.values.elementAt(index) == 0.00
                        ? notifier.yellowcorner(index, value += 10.00)
                        : notifier.yellowcorner(index, value += 10.00);
                    break;

                  case kBread:
                  case kBottleWater:
                    double value =
                    notifier.yellowcafeteria.values.elementAt(index);
                    notifier.yellowcafeteria.values.elementAt(index) == 0.00
                        ? notifier.yellowcorner(index, value += 70.00)
                        : notifier.yellowcorner(index, value += 70.00);

                    break;
                  case kNoodles:
                    double value =
                    notifier.yellowcafeteria.values.elementAt(index);
                    notifier.yellowcafeteria.values.elementAt(index) == 0.00
                        ? notifier.yellowcorner(index, value += 80.00)
                        : notifier.yellowcorner(index, value += 80.00);

                    break;
                  case kChicken:
                    double value =
                    notifier.yellowcafeteria.values.elementAt(index);
                    notifier.yellowcafeteria.values.elementAt(index) == 0.00
                        ? notifier.yellowcorner(index, value += 150.00)
                        : notifier.yellowcorner(index, value += 150.00);

                    break;
                }
              },
            ),
            mcontinue: () async{
              final item = Provider.of<ShowItemPickedNotifier>(context);
              await notifier.yellowcafeteria
                  .forEach((keys, value) {
                if(value>0.0) {
                  item.additem(
                      Cafeteria(keys.foodimage, keys.foodname, 0.00),
                      value);
                }
              });

              if(delivery.delivery(2)==true){
                item.additem(
                    Cafeteria("images/dkd", "Delivery", 0.00),
                    50.00);
              }
              notifier.yellowtotal()==0.00 ?
              null:
              showfooditem();
            },
          ),
          CafeteriaFoodItemList(
            cafe: 'MUNCHES',
            performdelivery: (value) {
              delivery.mdelivery(3, value);
            },
            delivery: delivery.delivery(3),
            lenghtvalue: notifier.munchescafeteria.length,
            total: notifier.munchestotal(),
            itemBuild: (BuildContext context, int index) => FoodItem(
              foodimage:
                  notifier.munchescafeteria.keys.elementAt(index).foodimage,
              foodtype:
                  notifier.munchescafeteria.keys.elementAt(index).foodname,
              price: notifier.munchescafeteria.values.elementAt(index),
              removenotifier: () {
                switch (
                notifier.munchescafeteria.keys.elementAt(index).foodname) {
                  case kAmala:
                  case kFufu:
                  case kCowSkin:
                  case kBeans:
                  case kFriedRice:
                  case kJollofRice:
                  case kYam:
                  case kWhiteRice:
                  case kSpahgetti:
                    double value =
                    notifier.munchescafeteria.values.elementAt(index);
                    notifier.munchescafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.munches(index, value -= 20.00);
                    break;

                  case kEefo:
                  case kStew:
                    int decimal = 2;
                    int fac = pow(10,decimal);
                    double value =
                    notifier.munchescafeteria.values.elementAt(index);
                    value=(value * fac).round()/fac;
                    notifier.munchescafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.munches(index, value -= 0.02);
                    break;
                  case kMeat:
                  case kFriedEgg:
                  case kBoiledEgg:
                    double value =
                    notifier.munchescafeteria.values.elementAt(index);
                    notifier.munchescafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.munches(index, value -= 50.00);
                    break;

                  case kFish:
                  case kPepsi:
                  case kSalad:
                  case kBigiCola:
                  case kBigiLemon:
                  case kCocaCola:
                    double value =
                    notifier.munchescafeteria.values.elementAt(index);
                    notifier.munchescafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.munches(index, value -= 100.00);
                    break;

                  case kFiredPlantain:
                  case kPureWater:
                    double value =
                    notifier.munchescafeteria.values.elementAt(index);
                    notifier.munchescafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.munches(index, value -= 10.00);
                    break;

                  case kBread:
                  case kBottleWater:
                    double value =
                    notifier.munchescafeteria.values.elementAt(index);
                    notifier.munchescafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.munches(index, value -= 70.00);

                    break;
                  case kNoodles:
                    double value =
                    notifier.munchescafeteria.values.elementAt(index);
                    notifier.munchescafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.munches(index, value -= 80.00);

                    break;
                  case kChicken:
                    double value =
                    notifier.munchescafeteria.values.elementAt(index);
                    notifier.munchescafeteria.values.elementAt(index) == 0.00
                        ? null
                        : notifier.munches(index, value -= 150.00);

                    break;
                }
              },
              addnotifier: () {
                switch (
                notifier.munchescafeteria.keys.elementAt(index).foodname) {
                  case kAmala:
                  case kFufu:
                  case kCowSkin:
                  case kBeans:
                  case kFriedRice:
                  case kJollofRice:
                  case kYam:
                  case kWhiteRice:
                  case kSpahgetti:
                    double value =
                    notifier.munchescafeteria.values.elementAt(index);
                    notifier.munchescafeteria.values.elementAt(index) == 0.00
                        ? notifier.munches(index, value += 20.00)
                        : notifier.munches(index, value += 20.00);
                    break;

                  case kEefo:
                  case kStew:
                    int decimal = 2;
                    int fac = pow(10,decimal);
                    double value =
                    notifier.munchescafeteria.values.elementAt(index);
                    value=(value * fac).round()/fac;
                    notifier.munchescafeteria.values.elementAt(index) == 0.00
                        ? notifier.munches(index, value += 0.02)
                        : notifier.munches(index, value += 0.02);
                    break;
                  case kMeat:
                  case kFriedEgg:
                  case kBoiledEgg:
                    double value =
                    notifier.munchescafeteria.values.elementAt(index);
                    notifier.munchescafeteria.values.elementAt(index) == 0.00
                        ? notifier.munches(index, value += 50.00)
                        : notifier.munches(index, value += 50.00);
                    break;

                  case kFish:
                  case kPepsi:
                  case kSalad:
                  case kBigiCola:
                  case kBigiLemon:
                  case kCocaCola:
                    double value =
                    notifier.munchescafeteria.values.elementAt(index);
                    notifier.munchescafeteria.values.elementAt(index) == 0.00
                        ? notifier.munches(index, value += 100.00)
                        : notifier.munches(index, value += 100.00);
                    break;

                  case kFiredPlantain:
                  case kPureWater:
                    double value =
                    notifier.munchescafeteria.values.elementAt(index);
                    notifier.munchescafeteria.values.elementAt(index) == 0.00
                        ? notifier.munches(index, value += 10.00)
                        : notifier.munches(index, value += 10.00);
                    break;

                  case kBread:
                  case kBottleWater:
                    double value =
                    notifier.munchescafeteria.values.elementAt(index);
                    notifier.munchescafeteria.values.elementAt(index) == 0.00
                        ? notifier.munches(index, value += 70.00)
                        : notifier.munches(index, value += 70.00);

                    break;
                  case kNoodles:
                    double value =
                    notifier.munchescafeteria.values.elementAt(index);
                    notifier.munchescafeteria.values.elementAt(index) == 0.00
                        ? notifier.munches(index, value += 80.00)
                        : notifier.munches(index, value += 80.00);

                    break;
                  case kChicken:
                    double value =
                    notifier.munchescafeteria.values.elementAt(index);
                    notifier.munchescafeteria.values.elementAt(index) == 0.00
                        ? notifier.munches(index, value += 150.00)
                        : notifier.munches(index, value += 150.00);

                    break;
                }
              },
            ),
            mcontinue: () async{
              final item = Provider.of<ShowItemPickedNotifier>(context);
              await notifier.munchescafeteria
                  .forEach((keys, value) {
                if(value>0.0) {
                  item.additem(
                      Cafeteria(keys.foodimage, keys.foodname, 0.00),
                      value);
                }
              });
              if(delivery.delivery(3)==true){
                item.additem(
                    Cafeteria("images/dkd", "Delivery", 0.00),
                    50.00);
              }
              notifier.munchestotal()==0.00 ?
              null:
              showfooditem();
            },
          ),
          CafeteriaFoodItemList(
            cafe: 'FAST FOOD',
            performdelivery: (value) {
              delivery.mdelivery(4, value);
            },
            delivery: delivery.delivery(4),
            lenghtvalue: notifier.fastfood.length,
            total: notifier.fasttotal(),
            itemBuild: (BuildContext context, int index) => FoodItem(
              foodimage: notifier.fastfood.keys.elementAt(index).foodimage,
              foodtype: notifier.fastfood.keys.elementAt(index).foodname,
              price: notifier.fastfood.values.elementAt(index),
              removenotifier: () {
                switch (
                notifier.fastfood.keys.elementAt(index).foodname) {
                  case kMeat:
                  case kFriedEgg:
                  case kBoiledEgg:
                  case kSuya:
                    double value =
                    notifier.fastfood.values.elementAt(index);
                    notifier.fastfood.values.elementAt(index) == 0.00
                        ? null
                        : notifier.fastfoodventures(index, value -= 50.00);
                    break;

                  case kFish:
                  case kPepsi:
                  case kSalad:
                  case kBigiCola:
                  case kBigiLemon:
                  case kCocaCola:
                    double value =
                    notifier.fastfood.values.elementAt(index);
                    notifier.fastfood.values.elementAt(index) == 0.00
                        ? null
                        : notifier.fastfoodventures(index, value -= 100.00);
                    break;

                  case kFiredPlantain:
                  case kPureWater:
                    double value =
                    notifier.fastfood.values.elementAt(index);
                    notifier.fastfood.values.elementAt(index) == 0.00
                        ? null
                        : notifier.fastfoodventures(index, value -= 10.00);
                    break;

                  case kBottleWater:
                    double value =
                    notifier.fastfood.values.elementAt(index);
                    notifier.fastfood.values.elementAt(index) == 0.00
                        ? null
                        : notifier.fastfoodventures(index, value -= 70.00);

                    break;
                  case kNoodles:
                    double value =
                    notifier.fastfood.values.elementAt(index);
                    notifier.fastfood.values.elementAt(index) == 0.00
                        ? null
                        : notifier.fastfoodventures(index, value -= 80.00);

                    break;
                  case kChicken:
                    double value =
                    notifier.fastfood.values.elementAt(index);
                    notifier.fastfood.values.elementAt(index) == 0.00
                        ? null
                        : notifier.fastfoodventures(index, value -= 150.00);

                    break;
                  case kSharwama:
                    double value =
                    notifier.fastfood.values.elementAt(index);
                    notifier.fastfood.values.elementAt(index) == 0.00
                        ? null
                        : notifier.fastfoodventures(index, value -= 500.00);

                    break;
                }
              },
              addnotifier: () {
                switch (
                notifier.fastfood.keys.elementAt(index).foodname) {
                  case kMeat:
                  case kFriedEgg:
                  case kBoiledEgg:
                  case kSuya:
                    double value =
                    notifier.fastfood.values.elementAt(index);
                    notifier.fastfood.values.elementAt(index) == 0.00
                        ? notifier.fastfoodventures(index, value += 50.00)
                        : notifier.fastfoodventures(index, value += 50.00);
                    break;

                  case kFish:
                  case kPepsi:
                  case kSalad:
                  case kBigiCola:
                  case kBigiLemon:
                  case kCocaCola:
                    double value =
                    notifier.fastfood.values.elementAt(index);
                    notifier.fastfood.values.elementAt(index) == 0.00
                        ? notifier.fastfoodventures(index, value += 100.00)
                        : notifier.fastfoodventures(index, value += 100.00);
                    break;

                  case kFiredPlantain:
                  case kPureWater:
                    double value =
                    notifier.fastfood.values.elementAt(index);
                    notifier.fastfood.values.elementAt(index) == 0.00
                        ? notifier.fastfoodventures(index, value += 10.00)
                        : notifier.fastfoodventures(index, value += 10.00);
                    break;

                  case kBottleWater:
                    double value =
                    notifier.fastfood.values.elementAt(index);
                    notifier.fastfood.values.elementAt(index) == 0.00
                        ? notifier.fastfoodventures(index, value += 70.00)
                        : notifier.fastfoodventures(index, value += 70.00);

                    break;
                  case kNoodles:
                    double value =
                    notifier.fastfood.values.elementAt(index);
                    notifier.fastfood.values.elementAt(index) == 0.00
                        ? notifier.fastfoodventures(index, value += 80.00)
                        : notifier.fastfoodventures(index, value += 80.00);

                    break;
                  case kChicken:
                    double value =
                    notifier.fastfood.values.elementAt(index);
                    notifier.fastfood.values.elementAt(index) == 0.00
                        ? notifier.fastfoodventures(index, value += 150.00)
                        : notifier.fastfoodventures(index, value += 150.00);

                    break;
                  case kSharwama:
                    double value =
                    notifier.fastfood.values.elementAt(index);
                    notifier.fastfood.values.elementAt(index) == 0.00
                        ? notifier.fastfoodventures(index, value += 500.00)
                        : notifier.fastfoodventures(index, value += 500.00);

                    break;
                }
              },
            ),
            mcontinue: () async{
              final item = Provider.of<ShowItemPickedNotifier>(context);
              await notifier.fastfood
                  .forEach((keys, value) {
                if(value>0.0) {
                  item.additem(
                      Cafeteria(keys.foodimage, keys.foodname, 0.00),
                      value);
                }
              });
              if(delivery.delivery(4)==true){
                item.additem(
                    Cafeteria("images/dkd", "Delivery", 0.00),
                    50.00);
              }
              notifier.fasttotal()==0.00 ?
              null:
             showfooditem();
            },
          ),
        ],
      );
  },
    );
  }

  showfooditem(){
     showDialog(context: context,builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async{
          final item = Provider.of<ShowItemPickedNotifier>(context);
          item.itempicked.clear();
          return true;
        },
        child: Consumer<ShowItemPickedNotifier>(
          builder: (context,notifier,_) => Dialog(
            child: Stack(
                children:<Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: ListView.builder(
                      itemCount: notifier.itempicked.length,
                      itemBuilder: (BuildContext context,int index) => ShowFoodItemListTile(foodimage: notifier.itempicked.keys.elementAt(index).foodimage,foodtype: notifier.itempicked.keys.elementAt(index).foodname,price: notifier.itempicked.values.elementAt(index),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RawMaterialButton(
                            constraints: BoxConstraints(minHeight: 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), ),
                            ),
                            onPressed: (){
                              //TODO: check if credit card is added then complete payment , if not take the user to credit card details input
                              //TODO: Please!!!!!! Don't forget to clear the showitempicked Map after successful payment
                            }, child: Text('Pay',style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'SourceSansPro',fontSize: 20,color: Colors.white),),fillColor: Colors.green,),
                        ),
                        Expanded(
                          child: RawMaterialButton(
                            constraints: BoxConstraints(minHeight: 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0) ),
                            ),
                            onPressed: () {
                              final item = Provider.of<ShowItemPickedNotifier>(context);
                               item.itempicked.clear();
                              Navigator.pop(context);
                            }, child: Text('Cancel',style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'SourceSansPro',fontSize: 20,color: Colors.white),),fillColor: Colors.red,),
                        ),
                      ],
                    ),
                  )
                ]
            ),
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
          ),
        ),
      );
    });

    }

}


