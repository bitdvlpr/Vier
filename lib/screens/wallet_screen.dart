import 'package:Vier/model/datapointnotifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:provider/provider.dart';

class WalletScreen extends StatefulWidget {
  static const id = 'wallet_screen';

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {

    const List<DataPoint<dynamic>> data = [
      DataPoint<double>(value: 10, xAxis: 0),
      DataPoint<double>(value: 130, xAxis: 5),
      DataPoint<double>(value: 50, xAxis: 10),
      DataPoint<double>(value: 150, xAxis: 15),
      DataPoint<double>(value: 75, xAxis: 20),
      DataPoint<double>(value: 0, xAxis: 25),
      DataPoint<double>(value: 5, xAxis: 30),
      DataPoint<double>(value: 45, xAxis: 35),
    ];

    return Consumer<Datapoints>(
      builder: (context,spentdisplay,_) => RefreshIndicator(
        color: Colors.redAccent,
        onRefresh: () {},
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0),),
                color:  Color(0xFFFFFFFF),
              ),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: BezierChart(
                bezierChartScale: BezierChartScale.CUSTOM,
                xAxisCustomValues: spentdisplay.xvalue,
                series: const [
                  BezierLine(
                    lineColor: Colors.lightBlue,
                    data: data,
                  ),
                ],
                config: BezierChartConfig(
                  verticalIndicatorStrokeWidth: 3.0,
                  verticalIndicatorColor: Colors.black26,
                  contentWidth: MediaQuery.of(context).size.width,
                  showVerticalIndicator: true,
                  //backgroundColor: Colors.red,

                  showDataPoints: false,

                  snap: false,
                ),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: null,
                builder: (context, snapshot) {
                  return Expanded(
                    child: ListView(
                      children: <Widget>[

                        //TODO: Using ListTile

                      ],
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}





