import 'package:Vier/screens/login_screen.dart';
import 'dart:io' show Platform;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Vier/components/appbaraction.dart';
import 'package:Vier/constants.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:Vier/screens/loading_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/mainnotifier.dart';
import 'package:Vier/components/bottomhomescreen.dart';
import 'chat_screen.dart';
import 'edit_item_list_screen.dart';

final _auth = FirebaseAuth.instance;

class MainPage extends StatefulWidget {
  static const id = 'main_screen';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  signout() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Platform.isAndroid
              ? AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  title: Text('Logout'),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[Text('Are You Sure?')],
                  ),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () async {
                          await _auth.signOut();
                          final prefs = await SharedPreferences.getInstance();
                          prefs.clear();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text('Ok')),
                    FlatButton(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel')),
                  ],
                )
              : CupertinoAlertDialog(
                  title: Text('Logout'),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Text('Are You Sure?')],
                  ),
                  actions: <Widget>[
                    CupertinoButton(
                        child: Text('Ok'),
                        onPressed: () async {
                          await _auth.signOut();
                          final prefs = await SharedPreferences.getInstance();
                          prefs.clear();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        }),
                    CupertinoButton(
                        child: Text('Cancel'),
                        onPressed: () async {
                          Navigator.pop(context);
                        }),
                  ],
                );
        });
  }

  Future<String> store() async {
    final prefs = await SharedPreferences.getInstance();
    String chatid = prefs.getString("chatid") ?? null;

    print(chatid);
    return chatid;
  }

  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text('${store()}'),
        /* action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),*/
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(
      builder: (context, notifier, _) => WillPopScope(
        child: Platform.isAndroid
            ? Scaffold(
                backgroundColor: kMainColor,
                appBar: AppBar(
                  leading: AppBarActions(
                    icons: Icon(
                      (notifier.selectedindex == 0)
                          ? MaterialCommunityIcons.map_marker_outline
                          : (notifier.selectedindex == 1)
                              ? null
                              : (notifier.selectedindex == 2)
                                  ? null
                                  : (notifier.selectedindex == 3) ? null : null,
                      color: Color(0xFFFFFFFF),
                    ),
                    onTapped: () {
                      //Navigate to location image screen
                      (notifier.selectedindex == 0)
                          ? Navigator.pushReplacementNamed(
                              context, LoadingScreen.id)
                          : (notifier.selectedindex == 1)
                              ? print("empty ${notifier.selectedindex}")
                              : (notifier.selectedindex == 2)
                                  ? print("empty ${notifier.selectedindex}")
                                  : (notifier.selectedindex == 3)
                                      ? print("empty ${notifier.selectedindex}")
                                      : null;
                    },
                  ),
                  elevation: 0.0,
                  centerTitle: true,
                  backgroundColor: (notifier.selectedindex == 0)
                      ? kMainColor
                      : (notifier.selectedindex == 1)
                          ? kMainColor
                          : (notifier.selectedindex == 2)
                              ? kMainColor
                              : (notifier.selectedindex == 3)
                                  ? kMainColor
                                  : null,
                  //icons i like sort,subject,textalign for menu
                  //leading: Icon(Icons.sort,color: Colors.black,),
                  title: (notifier.selectedindex == 0)
                      ? Text(
                          'Vier',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontFamily: 'Pacifico',
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : (notifier.selectedindex == 1)
                          ? Text(
                              'Wallet',
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontFamily: 'Pacifico',
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : (notifier.selectedindex == 2)
                              ? Text(
                                  'Todo',
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontFamily: 'Pacifico',
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : (notifier.selectedindex == 3)
                                  ? Text(
                                      'Profile',
                                      style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontFamily: 'Pacifico',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : null,
                  actions: <Widget>[
                    //USING SETSTATE OR CHANGENOTIFIER
                    AppBarActions(
                      icons: Icon(
                        (notifier.selectedindex == 0)
                            ? Icons.chat_bubble_outline
                            : (notifier.selectedindex == 1)
                                ? Icons.credit_card
                                : (notifier.selectedindex == 2)
                                    ? Icons.add
                                    : (notifier.selectedindex == 3)
                                        ? Icons.exit_to_app
                                        : null,
                        color: Color(0xFFFFFFFF),
                      ),
                      onTapped: () {
                        (notifier.selectedindex == 0)
                            ? Navigator.pushNamed(context, ChatRoom.id)
                            : (notifier.selectedindex == 1)
                                ? print("Card ${notifier.selectedindex}")
                                : (notifier.selectedindex == 2)
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                StorageEditItem(
                                                  todo: null,
                                                )))
                                    : (notifier.selectedindex == 3)
                                        ? signout()
                                        : null;
                        //Navigate to chat screen
                      },
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                  ],
                ),
                body: Container(
                  margin: EdgeInsets.only(
                    bottom: 0.0,
                  ),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: widgetOptions.elementAt(notifier.selectedindex),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 50.0,
                          width: double.infinity,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFFFFFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(60.0),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              CustomBottomNavigation(
                                icon: Icon(
                                  MaterialCommunityIcons.home_outline,
                                  color: (notifier.wait1)
                                      ? Colors.lightBlue
                                      : kMainColor,
                                ),
                                index: 0,
                                wait1: true,
                                wait2: false,
                                wait3: false,
                                wait4: false,
                              ),
                              CustomBottomNavigation(
                                icon: Icon(
                                  MaterialCommunityIcons.wallet_outline,
                                  color: (notifier.wait2)
                                      ? Colors.lightBlue
                                      : kMainColor,
                                ),
                                index: 1,
                                wait1: false,
                                wait2: true,
                                wait3: false,
                                wait4: false,
                              ),
                              CustomBottomNavigation(
                                icon: Icon(
                                  Icons.storage,
                                  color: (notifier.wait3)
                                      ? Colors.lightBlue
                                      : kMainColor,
                                ),
                                index: 2,
                                wait1: false,
                                wait2: false,
                                wait3: true,
                                wait4: false,
                              ),
                              CustomBottomNavigation(
                                icon: Icon(
                                  Icons.person,
                                  color: (notifier.wait4)
                                      ? Colors.lightBlue
                                      : kMainColor,
                                ),
                                index: 3,
                                wait1: false,
                                wait2: false,
                                wait3: false,
                                wait4: true,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(),
                child: CupertinoTabScaffold(
                    tabBar: CupertinoTabBar(items: bottomnavitem),
                    tabBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return CupertinoTabView(
                            builder: (context) {
                              return CupertinoPageScaffold(child: null);
                            },
                          );
                      }
                    }),
              ),
        onWillPop: () async => false,
      ),
    );
  }
}
