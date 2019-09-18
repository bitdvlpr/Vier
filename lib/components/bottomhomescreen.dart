import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Vier/model/mainnotifier.dart';


class CustomBottomNavigation extends StatelessWidget {
  final Icon icon;
  final int index;
  final bool wait1;
  final bool wait2;
  final bool wait3;
  final bool wait4;


  CustomBottomNavigation({this.icon, this.index, this.wait1, this.wait2,
      this.wait3, this.wait4});

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<HomeNotifier>(context);
    return IconButton(
      onPressed: (){
        notifier.selectedindex = index;
        notifier.wait1 = wait1;
        notifier.wait2 = wait2;
        notifier.wait3 = wait3;
        notifier.wait4 = wait4;

      },
      icon: icon,
    );
  }
}
