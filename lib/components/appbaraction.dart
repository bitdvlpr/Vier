import 'package:flutter/material.dart';


class AppBarActions extends StatelessWidget {

  final Icon icons;
  final Function onTapped;


  AppBarActions({@required this.icons,@required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTapped,
      icon: icons,
    );
  }
}
