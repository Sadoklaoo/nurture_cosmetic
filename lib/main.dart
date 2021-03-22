import 'package:flutter/material.dart';
import 'package:liquid_ui/liquid_ui.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';

import 'Screens/login_screen.dart';
import 'Screens/signup_screen.dart';
import 'Screens/splash_screen.dart';

var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => LoginScreen(),
  "/signup": (BuildContext context) => SignUpScreen(),
  /* "/welcome": (BuildContext context) => WelcomeScreen(),


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
      materialApp: new MaterialApp(
          theme: ThemeData(
              primaryColor: AppTheme.primaryColor,
              accentColor: AppTheme.primaryAccentColor,
              fontFamily: 'Nunito'),
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
