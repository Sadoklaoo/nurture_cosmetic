import 'package:flutter/material.dart';
import 'package:liquid_ui/liquid_ui.dart';
import 'package:nurture_cosmetic/Screens/claims_option_screen.dart';
import 'package:nurture_cosmetic/Screens/infoPages/skin_role_screen.dart';
import 'package:nurture_cosmetic/Screens/account_pin_screen.dart';
import 'package:nurture_cosmetic/Screens/new_account_screen.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/FilterEngine.dart';
import 'Screens/account_number_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/my_claims_screen.dart';
import 'Screens/signup_screen.dart';
import 'Screens/splash_screen.dart';
import 'Screens/test_screen.dart';
import 'Screens/skip_or_take_screen.dart';
import 'Screens/settings_screen.dart';
import 'Screens/my_account_screen.dart';
import 'Screens/edit_profile_screen.dart';
import 'Screens/edit_password_screen.dart';
import 'Screens/my_allergy_screen.dart';
import 'Screens/setting_notifications_screen.dart';
import 'package:nurture_cosmetic/Screens/help_screen.dart';
import 'package:nurture_cosmetic/Screens/terms_screen.dart';
import 'package:nurture_cosmetic/Screens/translate_screen.dart';
import 'package:nurture_cosmetic/Screens/favorit_screen.dart';
import 'Screens/notifications_screen.dart';
import 'Screens/understand_screen.dart';
import 'Screens/know_screen.dart';
import 'Screens/details_screen.dart';
import 'Screens/infoPages/skin_type_screen.dart';
import 'Screens/infoPages/my_skin_type_screen.dart';
import 'Screens/ingredients_screen.dart';
import 'Screens/take_screen.dart';


var routes = <String, WidgetBuilder>{
  /* Skin Pages */
  "/skinRole": (BuildContext context) => SkinRoleScreen(),
  "/skinType": (BuildContext context) => SkinTypeScreen(),
  "/mySkinType": (BuildContext context) => MySkinTypeScreen(),
  // All Pages
  "/login": (BuildContext context) => LoginScreen(),
  "/signUp": (BuildContext context) => SignUpScreen(),
  "/newAccount": (BuildContext context) => NewAccountScreen(),
  "/skipOrTake": (BuildContext context) => SkipOrTakeScreen(),
  "/test": (BuildContext context) => TestScreen(),
  "/home": (BuildContext context) => HomeScreen(),
 // "/filter": (BuildContext context) => FilterEngine(),
  "/settings": (BuildContext context) => SettingsScreen(),
  "/myAccount": (BuildContext context) => MyAccountScreen(),
  "/edit": (BuildContext context) => EditProfileScreen(),
  "/editPassword": (BuildContext context) => EditPasswordScreen(),
  "/myAllergy": (BuildContext context) => MyAllergyScreen(),
  "/settingsNotifications": (BuildContext context) =>
      SettingNotificationsScreen(),
  "/claims": (BuildContext context) => ClaimsOptionsScreen(),
  "/myclaims": (BuildContext context) => MyClaimsScreen(),
  "/help": (BuildContext context) => HelpScreen(),
  "/terms": (BuildContext context) => TermsScreen(),
  "/translate": (BuildContext context) => TranslateScreen(),
  "/favorite": (BuildContext context) => FavoriteScreen(),
  "/notifications": (BuildContext context) => NotificationScreen(),
  "/understand": (BuildContext context) => UnderstandScreen(),
  "/know": (BuildContext context) => KnowScreen(),
  "/take": (BuildContext context) => TakeScreen(),
  // All

  /* "/welcome": (BuildContext context) => WelcomeScreen(),


  "/4got": (BuildContext context) => ForgotScreen(),
  "/pinpassword" : (BuildContext context) => PasswordPinScreen(),

  "/newpassword": (BuildContext context) => ChangePasswordScreen(),

  "/pending": (BuildContext context) => PendingScreen(),
  "/history": (BuildContext context) => HistoryScreen(),



  "/intro": (BuildContext context) => IntroScreen(),
  "/login": (BuildContext context) => LoginScreen(),

  */
};

void main() => runApp(
      LiquidApp(
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
      ),
    );
