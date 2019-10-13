import 'package:flutter/material.dart';

class CafeteriaFoodItemList extends StatefulWidget {


  final String cafe;
  final int lenghtvalue;
  final Function itemBuild;
  final double total;
  final Function mcontinue;
  final bool delivery;
  final Function performdelivery;
  CafeteriaFoodItemList({@required this.delivery,@required this.performdelivery,@required this.cafe,@required this.lenghtvalue,@required this.itemBuild,@required this.total,@required this.mcontinue});


  @override
  _CafeteriaFoodItemListState createState() => _CafeteriaFoodItemListState();
}


class _CafeteriaFoodItemListState extends State<CafeteriaFoodItemList> {

  @override
  Widget build(BuildContext context) {
     return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '${widget.cafe}',
          style: TextStyle(
              color: Colors.white,
              wordSpacing: 10,
              fontFamily: 'SourceSansPro',
              fontWeight: FontWeight.w300,
              fontSize: 25.0),
        ),
        Container(
          margin: EdgeInsets.only(left: 0.0,right: 10.0),
          width: MediaQuery.of(context).size.width/1.15,
          height: MediaQuery.of(context).size.height / 1.1,
          decoration: ShapeDecoration(
            color: Colors.pinkAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 120.0),
                child: ListView.builder(
                  itemCount: widget.lenghtvalue,
                  itemBuilder: widget.itemBuild,
                  scrollDirection: Axis.vertical,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 120.0,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Checkbox(
                                    value: widget.delivery,
                                    onChanged: widget.performdelivery),
                              ),
                              Expanded(child: Center(child: Text('Delivery',style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'SourceSansPro',fontSize: 17)))),
                              Expanded(child: Center(child: Text('#50',style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'SourceSansPro',fontSize: 18),),),),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                          )),
                      Expanded(child: Row(
                        children: <Widget>[
                          Expanded(child: Center(child: Text('Total',style: TextStyle(fontFamily: 'SourceSansPro',fontWeight: FontWeight.w900),))),
                          Expanded(child: Center(child: Text('${widget.delivery ? widget.total+50.00 : widget.total}',style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'SourceSansPro',fontSize: 20),)))
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                              child: RawMaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                              ),
                            ),
                          onPressed: widget.mcontinue,
                            fillColor: Colors.green,
                            constraints: BoxConstraints(minHeight: 50),
                            child: Text('Continue',style: TextStyle(color:Colors.white,fontWeight: FontWeight.w400,fontFamily: 'SourceSansPro',fontSize: 15)),
                           )),
                          Expanded(
                              child: RawMaterialButton(
                                fillColor: Colors.red,
                                constraints: BoxConstraints(minHeight: 50),
                                shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.0),
                              ),
                            ),
                            onPressed: (){

                            },
                            child: Text('Cancel',style: TextStyle(color:Colors.white,fontWeight: FontWeight.w400,fontFamily: 'SourceSansPro',fontSize: 15)),
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
