import 'package:Vier/model/cafeterianotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class FoodItem extends StatefulWidget {
  final foodimage;
  final foodtype;
  final price;
  final Function removenotifier;
  final Function addnotifier;

  FoodItem({this.foodimage,this.foodtype, this.price,this.removenotifier,this.addnotifier});

  @override
  _FoodItemState createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  int remove;
  int add;



  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(10.0)),child: Image.asset('${widget.foodimage}',fit: BoxFit.contain,width: 50,height: 50,)),
            )),
        Expanded(
            child: Center(child: Text('${widget.foodtype}'))),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: IconButton(
                    onPressed: widget.removenotifier, icon: Icon(Icons.remove)),
              ),
              Expanded(child: Center(child: Text('${widget.price}'))),
              Expanded(
                child: IconButton(
                    onPressed: widget.addnotifier, icon: Icon(Icons.add)),
              )
            ],
          ),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
