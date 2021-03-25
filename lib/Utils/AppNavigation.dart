import 'package:flutter/material.dart';

class AppNavigation {
  static void goToWelcome(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/welcome");
  }

  static void goToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/home");
  }
  static void goToNewAccount(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/newaccount");
  }

  static void goToIntro(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/intro");
  }

  static void goToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/login");
  }
  static void goToSignUp(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/signup");
  }

  static void goToEdit(BuildContext context) {
    Navigator.pushNamed(context, "/edit");
  }
  static void goToForgot(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/4got");
  }
  static void goToPinPassword(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/pinpassword");
  }
  static void goToNewPassword(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/newpassword");
  }
  static void goToPin(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/pinaccount");
  }
  static void goToNumber(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/numberaccount");
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
    Navigator.pushReplacementNamed(context, "/skiportake");
  }
  static void goToTest(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/test");
  }
}