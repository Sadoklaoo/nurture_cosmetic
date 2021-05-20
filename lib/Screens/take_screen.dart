import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/Drawer.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class TakeScreen extends StatefulWidget {
  @override
  _TakeScreenState createState() {
    return _TakeScreenState();
  }
}

class _TakeScreenState extends State<TakeScreen> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final List<String> brillance = [
    "Non, ma peau ne brille sur aucune zone du visage",
    "Oui, ma peau brille sur certaines zones uniquement",
    "Oui, ma peau brille facilement sur l'ensemble du visage",
  ];
  int _brillance = 0;

  final List<String> tiraille = [
    "Non, ma peau ne tiraille jamais / elle est toujours confortable",
    "Oui, ma peau tiraille de temps à autre / elle est parfois inconfortable",
    "Oui, ma peau tiraille sur l'ensemble du visage / elle est souvent inconfortable",
  ];
  int _tiraille = 0;

  final List<String> reactions = [
    "Non, jamais",
    "Oui, de temps à autre voire régulièrement",
  ];
  int _reactions = 0;

  final List<String> ridules = [
    "Non, pas du tout",
    "Oui, elle présente des marques, des ridules ou est inconfortable",
  ];
  int _ridules = 0;

  final List<String> rougeurs = [
    "Non, pas de rougeurs",
    "Oui, des rougeurs légères",
    "Oui, des rougeurs qui se remarquent",
  ];
  int _rougeurs = 0;

  final List<String> cernes = [
    "Non, jamais",
    "Oui, quelques cernes de temps en temps",
    "Oui, des cernes et des poches marquées",
  ];
  int _cernes = 0;

  final List<String> rides = [
    "Non, je n'ai ni ride, ni ridule",
    "Oui, quelques ridules",
    "Oui, des rides",
    "Oui, des rides et des tâches",
  ];
  int _rides = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: ThemeData(
          primaryColor: AppTheme.primaryColor,
          accentColor: AppTheme.primaryAccentColor,
          fontFamily: 'Nunito'),
      debugShowCheckedModeBanner: false,
      home: SideMenu(
        background: AppTheme.primaryColor,
        key: _sideMenuKey,
        menu: buildMenu(context),
        type: SideMenuType.slideNRotate,
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 40.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.chevron_left,
                              size: 40,
                              color: AppTheme.primaryColor,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Center(
                          child: Text("Diagnostic",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: AppTheme.primaryColor)),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  buildBrillances(),
                  buildTiraille(),
                  buildRadio("Avez-vous la peau du visage qui brille ? ", _brillance, brillance),
                  buildRadio("Avez-vous la peau du visage qui tiraille au quotidien ? ", _tiraille, tiraille),
                  buildRadio("Faites-vous des réactions allergiques au savon, calcaire, à certains bijoux ... ? ", _reactions, reactions),
                  buildRadio("Votre visage présente t\'il des ridules de déshydratation ... ou des marques d\'oreiller le matin au réveil ?", _ridules, ridules),
                  buildRadio("Avez-vous des rougeurs type couperose, rosacée ou eczéma sur le visage ? ", _rougeurs, rougeurs),
                  buildRadio("Avez-vous des cernes et des poches ? ", _cernes, cernes),
                  buildRadio("Avez-vous des rides, ridules ou tâches ? ", _rides, rides),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBrillances() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Avez-vous la peau du visage qui brille ?',
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: <Widget>[
                    for (int i = 0; i < brillance.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          title: Text(
                            brillance[i],
                          ),
                          leading: Radio(
                            value: i,
                            groupValue: _brillance,
                            activeColor: AppTheme.primaryAccentColor,
                            onChanged: (int value) {
                              setState(() {
                                _brillance = value;
                              });
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget buildTiraille() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Avez-vous la peau du visage qui tiraille au quotidien ? ',
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: <Widget>[
                    for (int i = 0; i < tiraille.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          title: Text(
                            tiraille[i],
                          ),
                          leading: Radio(
                            value: i,
                            groupValue: _tiraille,
                            activeColor: AppTheme.primaryAccentColor,
                            onChanged: (int value) {
                              setState(() {
                                _tiraille = value;
                              });
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget buildReaction() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Faites-vous des réactions allergiques au savon, calcaire, à certains bijoux ... ?',
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: <Widget>[
                    for (int i = 0; i < reactions.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          title: Text(
                            reactions[i],
                          ),
                          leading: Radio(
                            value: i,
                            groupValue: _reactions,
                            activeColor: AppTheme.primaryAccentColor,
                            onChanged: (int value) {
                              setState(() {
                                _reactions = value;
                              });
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget buildRidules() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Votre visage présente t\'il des ridules de déshydratation ... ou des marques d\'oreiller le matin au réveil ?',
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: <Widget>[
                    for (int i = 0; i < ridules.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          title: Text(
                            ridules[i],
                          ),
                          leading: Radio(
                            value: i,
                            groupValue: _ridules,
                            activeColor: AppTheme.primaryAccentColor,
                            onChanged: (int value) {
                              setState(() {
                                _ridules = value;
                              });
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget buildRadio(String question, int val, List<dynamic> options){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question,
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: <Widget>[
                    for (int i = 0; i < options.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          title: Text(
                            options[i],
                          ),
                          leading: Radio(
                            value: i,
                            groupValue: val,
                            activeColor: AppTheme.primaryAccentColor,
                            onChanged: (int value) {
                              setState(() {
                                val = value;
                              });
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
