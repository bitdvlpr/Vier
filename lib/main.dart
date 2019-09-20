import 'package:Vier/model/datapointnotifier.dart';
import 'package:Vier/model/locationnotifier.dart';
import 'package:Vier/screens/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:Vier/screens/main_screen.dart';
import 'package:Vier/screens/login_screen.dart';
import 'package:Vier/screens/location_screen.dart';
import 'package:Vier/screens/loading_screen.dart';
import 'package:Vier/screens/registration_screen.dart';
import 'package:provider/provider.dart';
import 'package:Vier/model/mainnotifier.dart';
import 'package:Vier/screens/splash_screen.dart';
import 'package:Vier/screens/profile_screen.dart';
import 'package:Vier/screens/edit_item_list_screen.dart';
import 'package:Vier/screens/storage_screen.dart';
import 'package:Vier/screens/wallet_screen.dart';
import 'package:Vier/screens/chat_screen.dart';
import 'package:Vier/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => HomeNotifier(),
        ),
        ChangeNotifierProvider(
          builder: (context) => Datapoints(),
        ),
        ChangeNotifierProvider(
          builder: (context) => LocationNotifier(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
