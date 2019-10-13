import 'package:Vier/components/listofcafeteria.dart';
import 'package:Vier/constants.dart';
import 'package:flutter/material.dart';


class BuyaMeal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: kMainColor,
      child: AllCafeteria(),

    );
  }
}
