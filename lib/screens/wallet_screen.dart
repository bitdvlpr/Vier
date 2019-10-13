import 'package:Vier/model/cafeterianotifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class WalletScreen extends StatefulWidget {
  static const id = 'wallet_screen';

  @override
  _WalletScreenState createState() => _WalletScreenState();
}


class _WalletScreenState extends State<WalletScreen> {

  bool show = true;
  var details = 'hide';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      show = true;
      details = 'hide';
    });

  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom:50.0),
      child: ListView(
          children:<Widget> [
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
                         Text('CODEX BANK',style: TextStyle(  color: Colors.white,fontFamily: 'SourceSansPro',fontWeight: FontWeight.w500,fontSize: 20.0),),
                       ],
                     ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Visibility(
                           child: Text("XXXX XXXX XXXX XXXX",style: TextStyle(  color: Colors.white,wordSpacing: 10,fontFamily: 'SourceSansPro',fontWeight: FontWeight.w300,fontSize: 25.0),),
                        visible: show,
                        ),
                        GestureDetector(child: Text('$details'), onTap: (){
                          setState(() {
                            if(show==true){
                            show = false;
                            details='show';
                            }else{
                              show = true;
                              details='hide';
                            }
                          });
                        },)
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
                              Text("MARCUS RASHFORD",style: TextStyle(  color: Colors.white,fontFamily: 'SourceSansPro',fontWeight: FontWeight.w300,fontSize: 18.0),),
                            ],
                          ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                               children: <Widget>[
                                Text("EXPIRY",style: TextStyle(  color: Colors.white,fontFamily: 'SourceSansPro',fontWeight: FontWeight.w200,fontSize: 10.0),),
                                Text("06/23",style: TextStyle(  color: Colors.white,fontFamily: 'SourceSansPro',fontWeight: FontWeight.w500,fontSize: 15.0),),

                              ],
                          ),
                           ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height:MediaQuery.of(context).size.width/5,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: null,
                builder: (context, snapshot) {
                  switch(snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      //return  ; TODO: add a progressdialog
                   default:
                  return (snapshot.hasData) ? Expanded(
                    child: ListView(
                      children: <Widget>[

                        //TODO: Using ListTile

                      ],
                    ),
                  ) : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        'images/account.svg',
                        width: MediaQuery.of(context).size.height/3,
                        height: MediaQuery.of(context).size.width/3,
                        color: Colors.lightBlueAccent,
                      ),
                      Text('No Transaction History',style: TextStyle(  color: Colors.white,fontFamily: 'SourceSansPro',fontWeight: FontWeight.w500,fontSize: 20.0),)
                    ],
                  );
                }
                }
            ),
        ],
        ),
    );
  }
}





