import 'package:Vier/components/dialogwidget.dart';
import 'package:Vier/components/text_field_form_data.dart';
import 'package:Vier/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  static const  id = "forgot_password";
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _auth = FirebaseAuth.instance;
  DialogWidget _dialogWidget = DialogWidget();
 String idemail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        title: Text('Forgot Password'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Enter Your Email Address',
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontFamily: 'Pacifico',
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FormData(
              fillcolor: Colors.white,
              inputtype: TextInputType.text,
              icons: Icons.email,
              text: 'Email',
              function: (value) {
                idemail = value;
              },
              obscure: false,
            ),
          ),

          SizedBox(
            height: 10,
          ),

          RaisedButton(onPressed: ()async{
            try {
             await _auth.sendPasswordResetEmail(email: idemail);
                _dialogWidget.androidalertdialog(context: context,content: 'Check your email',title: 'Successful');
            }catch(e){
              print(e);
            }
          }, child: Text('Submit'),color: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),)
        ],
      ),
    );
  }
}
