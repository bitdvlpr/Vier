import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';


class DialogWidget{

  void androidalertdialog({BuildContext context,String title , String content}) {
    showDialog(
        context: context,
        builder: (_) => FlareGiffyDialog(
          flarePath: 'images/space_demo.flr',
          flareAnimation: 'loading',
          title: Text(
            title,
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
          ),
          description: Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
          onOkButtonPressed: () {},
        ));
  }

  void iosalertdialog({String title , String content}) {
    CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        CupertinoButton(child: Text('Cancel'), onPressed: () {}),
        CupertinoButton(child: Text('Try again'), onPressed: () {}),
      ],
    );
  }

  void iosprogress() {
    CupertinoActivityIndicator(
      animating: true,
      radius: 20.0,
    );
  }


}