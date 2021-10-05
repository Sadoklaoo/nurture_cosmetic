import 'package:flutter/material.dart';

class AppNavigation {
  static void goToWelcome(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/welcome");
  }

  static void goToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/home");
  }
  static void goToNewAccount(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/newAccount");
  }

  static void goToIntro(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/intro");
  }

  static void goToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/login");
  }
  static void goToSignUp(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/signUp");
  }

  static void goToEdit(BuildContext context) {
    Navigator.pushNamed(context, "/edit");
  }
  static void goToForgot(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/4got");
  }
  static void goToPinPassword(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/pinPassword");
  }
  static void goToNewPassword(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/newPassword");
  }
  static void goToPin(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/pinAccount");
  }
  static void goToNumber(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/numberAccount");
  }
  static void goToPending(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/pending");
  }
  static void goToHistory(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/history");
  }
  static void goToSettings(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/settings");
  }
  static void goToNotifications(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/notifications");
  }
  static void goToSkipOrTake(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/skipOrTake");
  }
  static void goToTest(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/test");
  }
  static void goToFilter(BuildContext context) {
    Navigator.pushNamed(context, "/filter");
  }
  static void goToMyAccount(BuildContext context) {
    Navigator.pushNamed(context, "/myAccount");
  }
  static void goToEditPassword(BuildContext context) {
    Navigator.pushNamed(context, "/editPassword");
  }
  static void goToMyAllergy(BuildContext context) {
    Navigator.pushNamed(context, "/myAllergy");
  }
  static void goToSettingsNotifications(BuildContext context) {
    Navigator.pushNamed(context, "/settingsNotifications");
  }
  static void goToHelp(BuildContext context) {
    Navigator.pushNamed(context, "/help");
  }
  static void goToClaimsOptions(BuildContext context) {
    Navigator.pushNamed(context, "/claims");
  }
  static void goToMyClaims(BuildContext context) {
    Navigator.pushNamed(context, "/myclaims");
  }
  static void goToTerms(BuildContext context) {
    Navigator.pushNamed(context, "/terms");
  }

  static void goToLanguage(BuildContext context) {
    Navigator.pushNamed(context, "/translate");
  }
  static void goToFavorite(BuildContext context) {
    Navigator.pushNamed(context, "/favorite");
  }
  static void goToUnderstand(BuildContext context) {
    Navigator.pushNamed(context, "/understand");
  }
  static void goToKnow(BuildContext context) {
    Navigator.pushNamed(context, "/know");
  }

  static void goToIngredients(BuildContext context) {
    Navigator.pushNamed(context, "/ingredients");
  }
  static void goToTake(BuildContext context) {
    Navigator.pushNamed(context, "/take");
  }


  static void goToInfo(BuildContext context,String id) {
    print(id);
   // Navigator.pushNamed(context, "/know");
    switch(int.parse(id)){
      case 3 : Navigator.pushNamed(context, "/skinRole");
      break;
      case 4 : Navigator.pushNamed(context, "/skinType");
      break;
      case 5 : Navigator.pushNamed(context, "/mySkinType");
      break;
    }
  }

}