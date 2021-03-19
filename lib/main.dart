import 'package:flutter/material.dart';
import 'package:liquid_ui/liquid_ui.dart';

import 'Screens/login_screen.dart';
import 'Screens/splash_screen.dart';


var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => LoginScreen(),
  /* "/welcome": (BuildContext context) => WelcomeScreen(),

  "/signup": (BuildContext context) => SignUpScreen(),
  "/4got": (BuildContext context) => ForgotScreen(),
  "/pinpassword" : (BuildContext context) => PasswordPinScreen(),
  "/pinaccount" : (BuildContext context) => AccountPinScreen(),
  "/newpassword": (BuildContext context) => ChangePasswordScreen(),
  "/home": (BuildContext context) => HomeScreen(),
  "/pending": (BuildContext context) => PendingScreen(),
  "/history": (BuildContext context) => HistoryScreen(),
  "/settings": (BuildContext context) => SettingsScreen(),
  "/notifications": (BuildContext context) => NotificationsScreen(),

  "/intro": (BuildContext context) => IntroScreen(),
  "/login": (BuildContext context) => LoginScreen(),

  "/edit": (BuildContext context) => EditProfilePage(),*/
};
void main() => runApp(LiquidApp(
  materialApp:   new MaterialApp(



      supportedLocales: const <Locale>[

        Locale('en', ''),

        Locale('ar', ''),

        Locale('fr', ''),

      ],

      //theme: ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),

      debugShowCheckedModeBanner: false,

      home: SplashScreen(),

      routes: routes),
));



