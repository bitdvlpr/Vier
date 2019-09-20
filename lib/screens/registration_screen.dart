import 'dart:io' show Platform;

import 'package:Vier/components/dialogwidget.dart';
import 'package:Vier/encrypt/encrypt.dart';
import 'package:Vier/model/authProblems.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_screen.dart';
import 'package:Vier/components/text_field_form_data.dart';
import 'package:Vier/constants.dart';


class RegistrationScreen extends StatefulWidget {
  static const id = "register_screen";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  DialogWidget _dialogWidget;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Encrypt _encrypt = Encrypt();

  TextEditingController controller = TextEditingController();
  String idemail;
  String idpassword;
  String dob;
  String phoneno;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: ProgressHUD(
        child: Builder(
          builder:(context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                SizedBox(
                  height: 5.0,
                ),
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
                        borderRadius: BorderRadius.all(Radius.circular(40.0),),
                      ),
                    ),
                    width: MediaQuery.of(context).size.height/2 ,
                    height: MediaQuery.of(context).size.height/1.5,
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
                                idemail= value;
                              },
                              obscure: false,
                            ),
                            FormData(
                              inputtype: TextInputType.datetime,
                              icons: Icons.calendar_today,
                              text: 'Date Of Birth',
                              function: (value) {
                                dob= value;
                              },
                              obscure: false,
                            ),
                            FormData(
                              inputtype: TextInputType.phone,
                              icons: Icons.call,
                              text: 'Phone Number',
                              function: (value) {
                                phoneno= value;
                              },
                              obscure: false,
                            ),
                            FormData(
                              inputtype: TextInputType.text,
                              icons: Icons.lock_outline,
                              text: 'Staff no | Matric no',
                              function: (value) {
                                idpassword=value;
                              },
                              obscure: true,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              onPressed: () async{

                                final progress = ProgressHUD.of(context);
                                Platform.isAndroid
                                    ? progress.show()
                                    : _dialogWidget.iosprogress();

                                try {

                                  final user = await _auth.createUserWithEmailAndPassword(
                                      email: '$idemail@ortoloop.com',
                                      password: idpassword);

                                  //TODO: save the staff id / matric id  three value i.e.  17N02/001  get the 'N' alphabetic to use in the chat message firetore

                                  if(user!=null){
                                    final prefs = await SharedPreferences.getInstance();
                                    prefs.setString("id", '$idemail@ortoloop.com');

                                   print(_encrypt.encrypt(idpassword));

                                    prefs.setString("password", _encrypt.encrypt(idpassword));
                                    prefs.setString("dob", dob);
                                    prefs.setString("phoneno", phoneno);

                                    //3,9
                                    print(idemail.substring(3,9));
                                    print(_encrypt.encrypt(idemail.substring(3,9)));

                                    prefs.setString("chatid",_encrypt.encrypt(idemail.substring(3,9)));

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MainPage()));

                                  }else if (idemail == null || idpassword == null) {
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

                                  progress.dismiss();

                                }on PlatformException catch (e) {
                                  authProblems errorType;

                                  if (Platform.isAndroid) {
                                    switch (e.message) {
                                      case 'There is no user record corresponding to this identifier. The user may have been deleted.':
                                        errorType = authProblems.UserNotFound;
                                        _dialogWidget.androidalertdialog(
                                            context: context,
                                            title: "No User Found",
                                            content:
                                            "There is no user record corresponding to this identifier. The user may have been deleted.");
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
                            SizedBox(
                              width: 30.0,
                            )
                          ],
                        ),
                        Text(
                          "Already have an account?Log In",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: kMainColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
