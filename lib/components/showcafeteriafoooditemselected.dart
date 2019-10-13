import 'package:flutter/material.dart';

class ShowFoodItemListTile extends StatelessWidget {
  final String foodimage;
  final String foodtype;
  final double price;


  ShowFoodItemListTile({this.foodimage,this.foodtype, this.price});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: <Widget>[
        Expanded(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('$foodimage'),
        )),
        Expanded(child: Center(child: Text('$foodtype'))),
        Expanded(child: Center(child: Text('$price'))),
      ],

    );
  }
}
