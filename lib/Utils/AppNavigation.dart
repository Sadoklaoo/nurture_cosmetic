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
  static void goToTerms(BuildContext context) {
    Navigator.pushNamed(context, "/terms");
  }

  static void goToLanguage(BuildContext context) {
    Navigator.pushNamed(context, "/translate");
  }
}