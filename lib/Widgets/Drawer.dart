

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liquid_ui/liquid_ui.dart';
import 'package:nurture_cosmetic/Models/Session.dart';
import 'package:nurture_cosmetic/Models/User.dart';
import 'package:nurture_cosmetic/Screens/history_screen.dart';
import 'package:nurture_cosmetic/Screens/skip_result_screen.dart';
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

             /* SizedBox(height: 16.0),
              FutureBuilder(
                  future: user,
                  builder: (context, projectSnap) {
                    if(projectSnap.hasData ){
                      return LText(
                        "\l.lead{Bonjour},\n\l.lead.bold{"+projectSnap.data.firstName+"}",
                        baseStyle: TextStyle(color: Colors.white),
                      );
                    }
                    else  {
                      //print('project snapshot data is: ${projectSnap.data}');
                      return CircularProgressIndicator();
                    }

                  }),*/

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
              /*LListItem(
                backgroundColor: Colors.transparent,
                onTap: () {
                  AppNavigation.goToNotifications(context);
                },
                leading: Icon(Icons.notifications, size: 20.0, color: Colors.white),
                title: Text("Notifications"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),*/
              LListItem(
                backgroundColor: Colors.transparent,
                onTap: () {
                  AppNavigation.goToFavorite(context);
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HistoryScreen()));
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SkipResultScreen(

                      )
                  ));
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
                  AppNavigation.goToUnderstand(context);
                },
                leading: FaIcon(FontAwesomeIcons.newspaper,size: 20.0, color: Colors.white),
                title: Text("Comprendre"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
              // LListItem(
              //   backgroundColor: Colors.transparent,
              //   onTap: () {
              //     AppNavigation.goToKnow(context);
              //   },
              //   leading: FaIcon(FontAwesomeIcons.infoCircle,size: 20.0, color: Colors.white),
              //   title: Text("(Re)Connaître"),
              //   textColor: Colors.white,
              //   dense: true,
              //
              //   // padding: EdgeInsets.zero,
              // ),
              LListItem(
                backgroundColor: Colors.transparent,
                onTap: () {

                  AppNavigation.goToSettings(context);
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
                  Session s = new Session();
                  s.setLoggedOut();
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