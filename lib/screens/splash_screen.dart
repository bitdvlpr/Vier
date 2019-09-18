import 'dart:io' show Platform;
import 'package:Vier/components/dialogwidget.dart';
import 'package:Vier/model/authProblems.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import 'login_screen.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {

  static const id = "SplashScreen";


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    next();

  }

  DialogWidget _dialogWidget;
  Future next() async{
    FirebaseAuth _auth = FirebaseAuth.instance;

    final prefs = await SharedPreferences.getInstance();
    String id = prefs.getString("id") ?? null;
    String password = prefs.getString("password") ?? null;

    try {
      if(id != null && password != null){
      final user = await _auth.signInWithEmailAndPassword(
          email: id, password: password);

      if (user != null) {
        /*Duration duration = Duration(seconds: 8);
        await Future.delayed(duration, () {

        });
*/
        Navigator.pushNamed(context, MainPage.id);
      }
      } else if (id == null && password == null) {
          Navigator.pushNamed(context, LoginScreen.id);
      }
    }on PlatformException catch(e){

      authProblems errorType;

      if (Platform.isAndroid) {
        switch (e.message) {
          case 'There is no user record corresponding to this identifier. The user may have been deleted.':
            errorType = authProblems.UserNotFound;
            _dialogWidget.androidalertdialog(context:context,title: "No User Found",content: "There is no user record corresponding to this identifier. The user may have been deleted.");
            break;
          case 'The password is invalid or the user does not have a password.':
            errorType = authProblems.PasswordNotValid;
            _dialogWidget.androidalertdialog(context:context,title: "Invalid Password ",content: "The password is invalid or the user does not have a password.");
            break;
          case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
            errorType = authProblems.NetworkError;
            _dialogWidget.androidalertdialog(context:context,title: "Oops!! Network Connection ",content: "A network error (such as timeout, interrupted connection or unreachable host) has occurred.");
            break;
        // ...
          default:
            print('Case ${e.message} is not yet implemented');
        }
      } else if (Platform.isIOS) {
        switch (e.code) {
          case 'Error 17011':
            errorType = authProblems.UserNotFound;
            _dialogWidget.iosalertdialog(title: "No User Found",content: "There is no user record corresponding to this identifier. The user may have been deleted.");
            break;
          case 'Error 17009':
            errorType = authProblems.PasswordNotValid;
            _dialogWidget.iosalertdialog(title: "Invalid Password ",content: "The password is invalid or the user does not have a password.");
            break;
          case 'Error 17020':
            errorType = authProblems.NetworkError;
            _dialogWidget.iosalertdialog(title: "Oops!! Network Connection ",content: "A network error (such as timeout, interrupted connection or unreachable host) has occurred.");
            break;
        // ...
          default:
            print('Case ${e.message} is not yet implemented');
        }
      }
      print('The error is $errorType');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: kMainColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Vier',
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontFamily: 'Pacifico',
                  fontSize: 50,
                ),
              ),
            ),
          ],
        ),
      ), onWillPop: () async => false,
    );
  }
}
