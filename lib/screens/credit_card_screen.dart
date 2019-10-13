import 'package:Vier/constants.dart';
import 'package:Vier/model/weather.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CreditCard extends StatefulWidget {
  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: kMainColor,
        appBar: AppBar(
          backgroundColor: kMainColor,
          leading:null, title: Text('Add Card'),centerTitle: true,),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              decoration: ShapeDecoration(
                color: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0),),
                ),
              ),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.account_balance_wallet,color: Colors.lightBlueAccent,),
                        Text('XXXX XXXX',style: TextStyle(  color: Colors.white,fontFamily: 'SourceSansPro',fontWeight: FontWeight.w500,fontSize: 20.0),),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Text("XXXX XXXX XXXX XXXX",style: TextStyle(  color: Colors.white,wordSpacing: 10,fontFamily: 'SourceSansPro',fontWeight: FontWeight.w300,fontSize: 25.0),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text("OWNERS NAME",style: TextStyle(  color: Colors.white,fontFamily: 'SourceSansPro',fontWeight: FontWeight.w400,fontSize: 10.0),),
                            Text("XXXX XXXXXX",style: TextStyle(  color: Colors.white,fontFamily: 'SourceSansPro',fontWeight: FontWeight.w300,fontSize: 18.0),),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text("EXPIRY",style: TextStyle(  color: Colors.white,fontFamily: 'SourceSansPro',fontWeight: FontWeight.w200,fontSize: 10.0),),
                              Text("XX/XX",style: TextStyle(  color: Colors.white,fontFamily: 'SourceSansPro',fontWeight: FontWeight.w500,fontSize: 15.0),),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Card Number'
                ),
                onChanged: (value){

                },

              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: 'Expiry Date'
                          ),
                          onChanged: (value){

                          },
                        ),
                      ),

                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: 'Expiry Date'
                          ),
                          onChanged: (value){

                          },
                        ),
                      ),
                    ],
                  ),
                ),


                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'CVV'
                    ),
                    onChanged: (value){

                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Card Name'
                ),
                onChanged: (value){

                },
              ),
            ),

            Row(
              children: <Widget>[
                Expanded(
                    child: FlatButton(
                      color: Colors.lightBlueAccent,
                      onPressed: () async{

                        final prefs = await SharedPreferences.getInstance();
                        //prefs.setString("cardnumber", value);
                        //prefs.setString("cvv", value);
                        //prefs.setString("expirydate_mnth", value);
                        //prefs.setString("expirydate_year", value);
                        //prefs.setString("name", value);
                      }, child: Text('Add Card'),disabledColor: Colors.lightBlueAccent,
                    ),
                ),
              ],
            )
          ],
        ),
      );
  }
}
