

import 'package:flutter/material.dart';
import 'package:liquid_ui/liquid_ui.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';

Widget buildMenu(context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.symmetric(vertical: 50.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 22.0,
              ),
              SizedBox(height: 16.0),
              LText(
                "\l.lead{Bonjour},\n\l.lead.bold{Foulen}",
                baseStyle: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20.0),
              LListItem(
                backgroundColor: Colors.transparent,
                onTap: () {
                  AppNavigation.goToHome(context);
                },
                leading: Icon(Icons.home, size: 20.0, color: Colors.white),
                title: Text("Accueil"),
                textColor: Colors.white,
                dense: true,
              ),
              LListItem(
                backgroundColor: Colors.transparent,
                onTap: () {
               //   AppNavigation.goToPending(context);
                },
                leading: Icon(Icons.star, size: 20.0, color: Colors.white),
                title: Text("Favoris"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
              LListItem(
                backgroundColor: Colors.transparent,
                onTap: () {
              //    AppNavigation.goToHistory(context);
                },
                leading:
                Icon(Icons.history, size: 20.0, color: Colors.white),
                title: Text("Historique"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),

              LListItem(
                backgroundColor: Colors.transparent,
                onTap: () {
              //    AppNavigation.goToNotifications(context);
                },
                leading: Icon(Icons.notifications, size: 20.0, color: Colors.white),
                title: Text("Notifications"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
              LListItem(
                backgroundColor: Colors.transparent,
                onTap: () {
               //   AppNavigation.goToSettings(context);
                },
                leading: Icon(Icons.settings, size: 20.0, color: Colors.white),
                title: Text("Paramétres"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
              LListItem(
                backgroundColor: Colors.transparent,
                onTap: () {
                  AppNavigation.goToLogin(context);
                },
                leading: Icon(Icons.filter_frames_sharp, size: 20.0, color: Colors.white),
                title: Text("Résultats"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
              LListItem(
                backgroundColor: Colors.transparent,
                onTap: () {
                  AppNavigation.goToLogin(context);
                },
                leading: Icon(Icons.logout, size: 20.0, color: Colors.white),
                title: Text("Se déconnecter"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ],
          ),
        ),

      ],
    ),
  );
}