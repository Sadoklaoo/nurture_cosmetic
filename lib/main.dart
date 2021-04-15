import 'package:flutter/material.dart';
import 'package:liquid_ui/liquid_ui.dart';
import 'package:nurture_cosmetic/Screens/account_pin_screen.dart';
import 'package:nurture_cosmetic/Screens/new_account_screen.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/FilterEngine.dart';
import 'Screens/account_number_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/signup_screen.dart';
import 'Screens/splash_screen.dart';
import 'Screens/test_screen.dart';
import 'Screens/skip_or_take_screen.dart';
import 'Screens/settings_screen.dart';
import 'Screens/my_account_screen.dart';
import 'Screens/edit_profile_screen.dart';
import 'Screens/edit_password_screen.dart';
import 'Screens/my_allergy_screen.dart';


var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => LoginScreen(),
  "/signUp": (BuildContext context) => SignUpScreen(),
  "/newAccount": (BuildContext context) => NewAccountScreen(),
  "/pinAccount" : (BuildContext context) => AccountPinScreen(),
  "/numberAccount" : (BuildContext context) => AccountNumberScreen(),
  "/skipOrTake" : (BuildContext context) => SkipOrTakeScreen(),
  "/test" : (BuildContext context) => TestScreen(),
  "/home": (BuildContext context) => HomeScreen(),
  "/filter": (BuildContext context) => FilterEngine(),
  "/settings": (BuildContext context) => SettingsScreen(),
  "/myAccount": (BuildContext context) => MyAccountScreen(),
  "/edit": (BuildContext context) => EditProfileScreen(),
  "/editPassword": (BuildContext context) => EditPasswordScreen(),
  "/myAllergy": (BuildContext context) => MyAllergyScreen(),
  /* "/welcome": (BuildContext context) => WelcomeScreen(),


  "/4got": (BuildContext context) => ForgotScreen(),
  "/pinpassword" : (BuildContext context) => PasswordPinScreen(),

  "/newpassword": (BuildContext context) => ChangePasswordScreen(),

  "/pending": (BuildContext context) => PendingScreen(),
  "/history": (BuildContext context) => HistoryScreen(),

  "/notifications": (BuildContext context) => NotificationsScreen(),

  "/intro": (BuildContext context) => IntroScreen(),
  "/login": (BuildContext context) => LoginScreen(),

  */
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
