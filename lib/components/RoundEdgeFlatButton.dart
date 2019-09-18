import 'package:flutter/material.dart';


class RoundEdgeFlatButton  extends StatelessWidget {
  final String title;
  final Function ontap;
  final Color color;
  final bool visible;

  RoundEdgeFlatButton({@required this.title,@required this.ontap,@required this.color,this.visible});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: FlatButton(onPressed: ontap, child: Text(title,),shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40.0)),
      ),
      color: color,),
    );
  }
}
