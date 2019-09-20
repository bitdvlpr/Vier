import 'package:flutter/material.dart';
import 'package:Vier/constants.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';


class FormData extends StatefulWidget {
  final IconData icons;
  final String text;
  final Function function;
  final bool obscure ;
  final TextEditingController controller;
  final TextInputType inputtype;
  final Color fillcolor;

  FormData(
      {@required this.icons, @required this.text, @required this.function,@required this.obscure,@required this.controller,this.inputtype,@required this.fillcolor});

  @override
  _FormDataState createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscure,
        keyboardType: widget.inputtype,
        decoration: kTextFieldDecoration.copyWith(
          fillColor: widget.fillcolor ,
          prefixIcon: Icon(
            widget.icons,
            //color: Color(0xff232D37),
          ),
          labelText: widget.text,
          //labelStyle: TextStyle(color: Color(0xff232D37)),
        ),
        onChanged: widget.function,
      ),
    );
  }
}
