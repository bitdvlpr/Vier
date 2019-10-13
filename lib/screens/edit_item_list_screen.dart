import 'package:Vier/screens/buyamealscreen.dart';
import 'package:Vier/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:Vier/constants.dart';
import 'package:Vier/components/RoundEdgeFlatButton.dart';
import 'package:Vier/db/todo_provider.dart';
import 'package:intl/intl.dart';


class StorageEditItem extends StatefulWidget {
  final Todo todo;


  static const id = 'edit_screen';


  StorageEditItem({this.todo});

  @override
  _StorageEditItemState createState() => _StorageEditItemState();
}

class _StorageEditItemState extends State<StorageEditItem> {


  final messagecontroller_title = TextEditingController();
  final messagecontroller_details = TextEditingController();


  String title='' ;

  TodoProvider _todoProvider = TodoProvider();

  String item = 'Food';
  String details= '' ;


  String datetime(){
    String formatted;
    setState(() {
      var now = new DateTime.now();
      var formatter = new DateFormat('h:mm a dd-MM-yyyy');
       formatted = formatter.format(now);
      print(formatted);

    });

    return formatted;
  }

  void todostatus(){
    if(widget.todo==null) {
      details ='';
      title = '';
      item = 'Food';
    }else{
      print('${widget.todo.id} ${widget.todo.details}  ${widget.todo.title} ${widget.todo.category}' );

      messagecontroller_title.text = widget.todo.title;
      messagecontroller_details.text = widget.todo.details;
      item =  widget.todo.category ;
      details =widget.todo.details;
      title = widget.todo.title;
      item = widget.todo.category;

    }
  }

  @override
  void initState() {
    super.initState();
    todostatus();

     print( datetime());

  }

  DropdownButton androidpicker(BuildContext context){


    List<DropdownMenuItem<String>> android = [];

    for(String itempicked in picker){
      dynamic dropitem =  DropdownMenuItem(child: Text(itempicked,),value: itempicked,);
      android.add(dropitem);

    }

    return DropdownButton(value:item, items: android, onChanged: (selectedvalue){
    setState(() {
        item = selectedvalue;
       });
    });
  }

  CupertinoPicker iospicker(BuildContext context){

    List<Text> iositem = [];

    for(String itempicked in picker){

      iositem.add( Text(itempicked,),);

    }

    return CupertinoPicker(itemExtent: 35.0, onSelectedItemChanged: (selectedvalue){
      setState(() {
        item = picker[selectedvalue];
      });
    }, children: iositem);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
      ),
      body: Container(
        color: kMainColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(
              maxLines: 1,
              controller: messagecontroller_title,
              decoration: InputDecoration(
                focusColor: Colors.transparent,
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(0.0),),
                ),
                labelText: 'Title',
              ),
              onChanged: (value){
                  title = value;
              },
            ),
            TextField(
              controller: messagecontroller_details,
              maxLines: 15,
              decoration: InputDecoration(
                focusColor: Colors.transparent,
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(0.0),),
                ),
                hintText: 'Get things done ',
              ),
            onChanged: (value){
                  details = value;
            },
            //TODO: Find more about this widget
            ),

            Container(
                padding: EdgeInsets.symmetric(horizontal: 50.0,),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30.0),),
                ),
                child: Platform.isIOS ? iospicker(context): androidpicker(context)),

            Row(
              mainAxisAlignment: item == 'Food' ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center ,
              children: <Widget>[
                item == 'Food' ? RoundEdgeFlatButton(title: 'Buy a meal', ontap: () async{
                  if(widget.todo==null) {
                    print(' $title $details $item ${datetime()}' );
                    await _todoProvider.insert(Todo(title: title,details: details,category: item,datetime: datetime()));
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> BuyaMeal()));
                  }else{
                    print('${widget.todo.id} $title $details $item ${datetime()}' );
                    await _todoProvider.update(Todo(id: widget.todo.id,title: title,details: details,category: item,datetime: datetime()));
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> BuyaMeal()));
                  }

                  //TODO: Show dialog
                  //TODO: Pay into the seller account , update chart,send , message using cloudsms

                }, color: Colors.white,visible: true,) : RoundEdgeFlatButton(title: 'Pay', ontap: (){}, color: Colors.transparent,visible: false,),
                RoundEdgeFlatButton(title: 'Save',ontap: () async{
                  if(widget.todo==null) {
                    print(' $title $details $item ${datetime()}' );
                    await _todoProvider.insert(Todo(title: title,details: details,category: item,datetime: datetime()));
                    Navigator.pop(context);
                  }else{
                    print('${widget.todo.id} $title $details $item ${datetime()}' );
                    await _todoProvider.update(Todo(id: widget.todo.id,title: title,details: details,category: item,datetime: datetime()));
                    Navigator.pop(context);
                  }
                } ,color: Colors.white,visible: true,),
              ],
            )
          ],
        ),
      ),
    );
  }
}


