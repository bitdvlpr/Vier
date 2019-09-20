import 'dart:io';
import 'package:Vier/components/chatmessages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

final _firestore = Firestore.instance;

class ChatRoom extends StatefulWidget {
  static const id = 'chat_screen';

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  //NOTE: id = 0 is for message , id = 1 is for images


  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _loggedinuser ;


  final messagecontroller = TextEditingController();
  String imageUrl;
  String message;
  File _image;
  String chatid;


  void checkuserid() async{
    try {
      final user = await _auth.currentUser();
      if (user != null) {

        _loggedinuser = user;

      }
    }catch(e){
      print(e);
    }

  }


  Future checkdoc() async {

    final prefs = await SharedPreferences.getInstance();
    setState(() {
      chatid = prefs.getString("chatid");
    });
    DocumentReference qs =
        _firestore.collection(chatid).document('Vier');
    DocumentSnapshot snap = await qs.get();

    if (snap.exists) {
      print('Thank you');
    } else {
      _firestore
          .collection(chatid)
          .document('Vier')
          .setData({'id': 0,'sender': 'Vier', 'msgimg': 'Hi Welcome, to my world','timestamp': DateTime.now().millisecondsSinceEpoch.toString(),});
    }
  }

  Future getImage(BuildContext context) async {
    _image = await ImagePicker.pickImage(source: ImageSource.gallery);

    final isLoading = ProgressHUD.of(context);

    if (_image != null) {
      setState(() {
        isLoading.show();
      });
      uploadFile(context);
    }
  }

  Future uploadFile(BuildContext context) async {
    String fileName = '$chatid${DateTime.now().millisecondsSinceEpoch.toString()}';
    final isLoading = ProgressHUD.of(context);

    final StorageReference storageReference =
        FirebaseStorage.instance.ref().child(fileName);

    final StorageUploadTask uploadTask = storageReference.putFile(_image);

    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
      imageUrl = downloadUrl;
      setState(() {
        isLoading.dismiss();
        onSendMessage( msgImg: imageUrl, id: 1,);
      });
    }, onError: (err) {
      setState(() {
        isLoading.dismiss();
      });
    });
  }

  Future onSendMessage({@required String msgImg,@required int id }) async{


    switch(id){
      case 0:
        _firestore.collection(chatid).add({
          'id' : 0,
          'sender': _loggedinuser.email ?? null,
          'msgimg': msgImg,
          'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
        });
        break;
      case 1:
        _firestore.collection(chatid).add({
          'id' : 1,
          'sender': _loggedinuser.email ?? null,
          'msgimg': msgImg,
          'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
        });
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatid='0000';
    imageUrl = '';
    checkdoc();
    checkuserid();
  }

  //TODO: get the staff id / matric id  three value i.e.  17N02/001  get the 'N' alphabetic to use in the chat message firetore

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        title: Text(
          'ChatRoom',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontFamily: 'Pacifico',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ProgressHUD(
        child: Builder(
          builder: (context) => SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                StreamBuilder<QuerySnapshot>(
                    stream: _firestore.collection(chatid).orderBy('timestamp',descending: true).snapshots(), //TODO: get the cloud firestore message using snapshot
                    builder: (context, snapshot) {
                      //snapshot.data.documents.reversed;
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                      return (!snapshot.hasData) ? CupertinoActivityIndicator(
                        animating: true,
                        radius: 10.0,
                      ) : Text("Hello World",style: TextStyle(color: Colors.transparent),);
                      break;
                      default:

                      return Expanded(
                      child: ListView.builder(
                      itemCount: snapshot.data.documents.length,
                        reverse: true,
                      itemBuilder: (BuildContext context, int index) => ChatMessage(documentSnapshot: snapshot.data.documents[index], loggedinuser: _loggedinuser.email,),

                      ),

                      );
                    }
                    }),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: (){
                        getImage(context);
                      },
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          controller: messagecontroller,
                          maxLines: null,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 70.0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(40.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                            hintText: 'Type a message',
                          ),
                          keyboardType: TextInputType.multiline,
                          onChanged: (value) {
                            //Do something with the user input.
                            message = value;
                          },
                        ),
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                        onPressed: (){
                          messagecontroller.clear();
                          onSendMessage(msgImg: message, id: 0,);
                        }
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
