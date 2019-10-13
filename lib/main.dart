import 'package:Vier/model/cafeterianotifier.dart';
import 'package:Vier/model/deliverynotifier.dart';
import 'package:Vier/model/locationnotifier.dart';
import 'package:Vier/model/showitempickednotifier.dart';
import 'package:Vier/screens/forgot_password_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Vier/screens/main_screen.dart';
import 'package:Vier/screens/login_screen.dart';
import 'package:Vier/screens/location_screen.dart';
import 'package:Vier/screens/loading_screen.dart';
import 'package:Vier/screens/registration_screen.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:Vier/model/mainnotifier.dart';
import 'package:Vier/screens/splash_screen.dart';
import 'package:Vier/screens/profile_screen.dart';
import 'package:Vier/screens/edit_item_list_screen.dart';
import 'package:Vier/screens/storage_screen.dart';
import 'package:Vier/screens/wallet_screen.dart';
import 'package:Vier/screens/chat_screen.dart';
import 'package:Vier/screens/home_screen.dart';
import 'dart:io' show Platform;

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => HomeNotifier(),
        ),
        ChangeNotifierProvider(
          builder: (context) => CafeteriaNotifier(),
        ),
        ChangeNotifierProvider(
          builder: (context) => LocationNotifier(),
        ),
        ChangeNotifierProvider(
          builder: (context) => ShowItemPickedNotifier(),
        ),
        ChangeNotifierProvider(
          builder: (context) => DeliveryNotifier(),
        ),
      ],
      child: MyApp(),
    ),
  )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? MaterialApp(
      title: 'Vier',
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        MainPage.id: (context) => MainPage(),
        LoginScreen.id: (context) => LoginScreen(),
        LocationMap.id: (context) => LocationMap(),
        LoadingScreen.id: (context) => LoadingScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        StorageScreen.id: (context) => StorageScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        StorageEditItem.id: (context) => StorageEditItem(),
        WalletScreen.id: (context) => WalletScreen(),
        ChatRoom.id: (context) => ChatRoom(),
        HomeScreen.id: (context) => HomeScreen(),
        ForgotPassword.id: (context) => ForgotPassword(),
      },
    ) : CupertinoApp(
      title: 'Vier',
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        MainPage.id: (context) => MainPage(),
        LoginScreen.id: (context) => LoginScreen(),
        LocationMap.id: (context) => LocationMap(),
        LoadingScreen.id: (context) => LoadingScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        StorageScreen.id: (context) => StorageScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        StorageEditItem.id: (context) => StorageEditItem(),
        WalletScreen.id: (context) => WalletScreen(),
        ChatRoom.id: (context) => ChatRoom(),
        HomeScreen.id: (context) => HomeScreen(),
        ForgotPassword.id: (context) => ForgotPassword(),
      },
    );
  }
}
