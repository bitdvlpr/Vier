import 'package:Vier/components/dialogwidget.dart';
import 'package:Vier/encrypt/encrypt.dart';
import 'package:Vier/model/authProblems.dart';
import 'package:Vier/screens/forgot_password_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_screen.dart';
import 'package:Vier/components/text_field_form_data.dart';
import 'package:Vier/screens/registration_screen.dart';
import 'package:Vier/constants.dart';
import 'dart:io' show Platform;

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  DialogWidget _dialogWidget;
  ProgressDialog _progressDialog;

  Encrypt _encrypt = Encrypt();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController controller = TextEditingController();
  String idemail;
  String idpassword;

  bool progressbar = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: kMainColor,
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Vier',
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontFamily: 'Pacifico',
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.center,
                ),
                Center(
                  child: Container(
                    decoration: ShapeDecoration(
                      color: Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0),
                        ),
                      ),
                    ),
                    width: MediaQuery.of(context).size.height / 2,
                    height: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            FormData(
                              inputtype: TextInputType.text,
                              icons: Icons.person_outline,
                              text: 'Staff no | Matric no',
                              function: (value) {
                                idemail = value;
                              },
                              obscure: false,
                            ),
                            FormData(
                              inputtype: TextInputType.text,
                              icons: Icons.lock_outline,
                              text: 'Staff no | Matric no',
                              function: (value) {
                                idpassword = value;
                              },
                              obscure: true,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            FlatButton(
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: kMainColor,
                                ),
                              ),
                              color: Colors.transparent,
                              onPressed: () {
                                //TODO: Create a forgot password screen
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ForgotPassword()));
                              },
                            ),
                            SizedBox(
                              width: 40.0,
                            ),
                            FloatingActionButton(
                              onPressed: () async {
                                _progressDialog =new ProgressDialog(context,type: ProgressDialogType.Normal,isDismissible: false,showLogs: false);
                                _progressDialog.style(
                                  message: "Please wait...",
                                  borderRadius: 10.0,
                                  backgroundColor: Colors.white,
                                 // progressWidget: CircularProgressIndicator(),
                                  elevation: 4.0,
                                  insetAnimCurve: Curves.easeInOut,

                                );

                                Platform.isAndroid
                                    ? _progressDialog.show()
                                    : _dialogWidget.iosprogress();

                                try {
                                  final user =
                                      await _auth.signInWithEmailAndPassword(
                                          email: '$idemail@ortoloop.com',
                                          password: _encrypt.encrypt(idpassword));

                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString(
                                      "id", '$idemail@ortoloop.com');

                                  print(_encrypt.encrypt(idpassword));

                                  prefs.setString("password", _encrypt.encrypt(idpassword));

                                  print(user);

                                  if (user != null) {
                                    //0,4
                                    print(idemail.substring(0,4));
                                    print(_encrypt.encrypt(idemail.substring(0,4)));

                                    prefs.setString("chatid",_encrypt.encrypt(idemail.substring(0,4)));
                                    //TODO: save the staff id / matric id  three value i.e.  17N02/001  get the 'N' alphabetic to use in the chat message firetore

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MainPage()));
                                  } else if (idemail == null ||
                                      idpassword == null) {
                                    Platform.isAndroid
                                        ? _dialogWidget.androidalertdialog(
                                            context: context,
                                            title: "No email Or Password ",
                                            content:
                                                "Please enter your details")
                                        : _dialogWidget.iosalertdialog(
                                            title: "No email Or Password ",
                                            content:
                                                "Please enter your details");
                                  }

                                  _progressDialog.dismiss();
                                } on PlatformException catch (e) {
                                  authProblems errorType;

                                  if (Platform.isAndroid) {
                                    switch (e.message) {
                                      case 'There is no user record corresponding to this identifier. The user may have been deleted.':
                                        errorType = authProblems.UserNotFound;
                                        _dialogWidget.androidalertdialog(
                                            context: context,
                                            title: "No User Found",
                                            content: "There is no user record corresponding to this identifier. The user may have been deleted.");
                                        break;
                                      case 'The password is invalid or the user does not have a password.':
                                        errorType =
                                            authProblems.PasswordNotValid;
                                        _dialogWidget.androidalertdialog(
                                            context: context,
                                            title: "Invalid Password ",
                                            content:
                                                "The password is invalid or the user does not have a password.");
                                        break;
                                      case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
                                        errorType = authProblems.NetworkError;
                                        _dialogWidget.androidalertdialog(
                                            context: context,
                                            title: "Oops!! Network Connection ",
                                            content:
                                                "A network error (such as timeout, interrupted connection or unreachable host) has occurred.");
                                        break;
                                      // ...
                                      default:
                                        print(
                                            'Case ${e.message} is not yet implemented');
                                    }
                                  } else if (Platform.isIOS) {
                                    switch (e.code) {
                                      case 'Error 17011':
                                        errorType = authProblems.UserNotFound;
                                        _dialogWidget.iosalertdialog(
                                            title: "No User Found",
                                            content:
                                                "There is no user record corresponding to this identifier. The user may have been deleted.");
                                        break;
                                      case 'Error 17009':
                                        errorType =
                                            authProblems.PasswordNotValid;
                                        _dialogWidget.iosalertdialog(
                                            title: "Invalid Password ",
                                            content:
                                                "The password is invalid or the user does not have a password.");
                                        break;
                                      case 'Error 17020':
                                        errorType = authProblems.NetworkError;
                                        _dialogWidget.iosalertdialog(
                                            title: "Oops!! Network Connection ",
                                            content:
                                                "A network error (such as timeout, interrupted connection or unreachable host) has occurred.");
                                        break;
                                      // ...
                                      default:
                                        print(
                                            'Case ${e.message} is not yet implemented');
                                    }
                                  }
                                  print('The error is $errorType');
                                }
                              },
                              backgroundColor: kMainColor,
                              child: Icon(Icons.arrow_forward),
                            ),
                          ],
                        ),
                        FlatButton(
                          color: Colors.transparent,
                          child: Text(
                            "Don't have an Account?Sign Up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: kMainColor,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RegistrationScreen()));
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
      ),
      onWillPop: () async => false,
    );
  }
}
