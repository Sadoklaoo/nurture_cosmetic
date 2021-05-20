import 'dart:math';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/Drawer.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:nurture_cosmetic/Widgets/UnorderedListWidget.dart';
import 'package:nurture_cosmetic/Utils/AppDesign.dart';

import 'package:nurture_cosmetic/Models/Option.dart';
import 'package:nurture_cosmetic/Utils/OptionDataSource.dart';

class MySkinTypeScreen extends StatefulWidget {
  @override
  _MySkinTypeScreenState createState() {
    return _MySkinTypeScreenState();
  }
}

class _MySkinTypeScreenState extends State<MySkinTypeScreen>
    with TickerProviderStateMixin {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  bool _showBackToTopButton = false;

  ScrollController _scrollController;

  final List<String> notices = [
    "de pores dilatés ",
    "de points noirs ",
    "de squames (autrement dit si la peau pèle par endroit) ",
    "de rougeurs.",
  ];
  final List<String> questions = [
    "Est-ce que le teint est lumineux ou terne ?",
    "Est-ce que la peau est rêche, poisseuse ou douce ?",
    "Est-ce que la peau est fine ou épaisse ?",
    "Est-ce que la peau tiraille, surtout après la toilette ?",
    "Est-ce que la peau est plutôt confortable au toucher ?",
  ];
  final List<String> steps = [
    "Se démaquiller",
    "Se nettoyer la peau avec un savon saponifié à froid",
    "Attendre 30 minutes ",
    "Placer un mouchoir en papier sur le visage et appuyer légèrement pendant une dizaine de secondes",
    "Retirer le mouchoir et observer à la lumière",
  ];
  final List<String> result = [
    "Il y a des traces de gras (transparences à la lumière) sur tout le mouchoir : vous avez probablement la peau grasse.",
    "Il y a des traces de gras seulement au niveau de la zone médiane (front, nez, menton) : vous avez probablement une peau mixte.",
    "Il n’y a aucune trace sur le mouchoir : vous avez la peau normale ou sèche.",
  ];

  List<Option> options = <Option>[];

  OptionDataSource optionDataSource;

  List<Option> getOptions() {
    return [
      Option("TEINT",
          "Clair, lumineux",
          "Terne, luisant",
          "Clair, terne",
          "Terne, luisant zone médiane",
          "Grisâtre,tâches pigmentaires"),
      Option("BRILLANCE",
          "Non",
          "Oui",
          "Non",
          "Oui, zone médiane",
          "Non"),
      Option("ÉPAISSEUR",
          "Normale",
          "Épaisse",
          "Fine",
          "Épaisse",
          "Fine"),
      Option("SENSIBILITÉ",
          "Non",
          "Non",
          "Importante",
          "Variable",
          "De plus en plus importante"),
      Option("PORES",
          "Serrés",
          "Dilatés",
          "Serrés",
          "Dilatés, zone médiane",
          "Serrés"),
      Option("POINTS NOIRS",
          "Non",
          "Oui",
          "Non",
          "Zone médiane",
          "Non"),
      Option("TOUCHER",
          "Doux, velouté",
          "Gras, moite",
          "Rêche",
          "Gras, zone médiane",
          "Variable"),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    options = getOptions();
    optionDataSource = OptionDataSource(employees: options);

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
  }

  // This function is triggered when the user presses the back-to-top button
  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: Duration(seconds: 1), curve: Curves.ease);
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

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
          floatingActionButton: _showBackToTopButton == false
              ? null
              : FloatingActionButton(
                  onPressed: _scrollToTop,
                  child: Icon(
                    Icons.arrow_upward,
                    color: AppTheme.whiteColor,
                  ),
                ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              controller: _scrollController,
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
                          child: Text("La peau",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: AppTheme.primaryColor)),
                        ),
                      ),
                      buildDrawerButton(),
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: height * 2 / 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Center(
                      child: Text(
                          "Avez-vous une suggestion ou avez-vous trouvé un bug? Faites-nous savoir dans le champ ci-dessous."),
                    ),
                  ),
                  SizedBox(
                    height: height * 2 / 100,
                  ),
                  Divider(),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                              "Déterminer son type de peau",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryColor)),
                        ),
                        AppDesign.buildBlock(
                          RichText(
                            text: TextSpan(
                              text:
                                  'Connaître son type de peau est essentiel pour savoir comment prendre soin de sa peau et au final avoir une belle peau. Le sébum régit l’hydratation de la peau et influe son aspect. Voici une méthode pour évaluer la capacité de votre peau à produire du sébum et vous aider à déterminer vous-même votre type de peau à un moment t donné.',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                color: AppTheme.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: AppTheme.whiteColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
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
                                      "Déterminer son type de peau grâce au Diagnostic Online",
                                      style: TextStyle(
                                          color: AppTheme.primaryAccentColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Réaliser le test du mouchoir permet de donner une indication sur le type de peau.",
                                      style: TextStyle(
                                        color: AppTheme.primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    _buildTestBtn(),
                                  ],
                                ),
                              )),
                        ),
                    //    _buildTable()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTestBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 2.0,
        onPressed: () => {},
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: AppTheme.primaryColor,
        child: Text(
          'Faire le test',
          style: TextStyle(
            color: AppTheme.whiteColor,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTable() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Expanded(
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
                    "Tableau récapitulatif des caractéristiques des types de peau",
                    style: TextStyle(
                        color: AppTheme.primaryAccentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "En observant attentivement sa peau et en se reportant au tableau ci-dessous, il est aussi possible de déterminer son type de peau.",
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Expanded(
                      child: SfDataGrid(
                        frozenColumnsCount: 1,
                        defaultColumnWidth: 130,

                        source: optionDataSource, columns: <GridColumn>[
                        GridTextColumn(
                            columnName: 'name',
                            label: Container(
                                width: 120,
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '',
                                ))),
                        GridTextColumn(
                            columnName: 'normal',
                            width: 120,
                            label: Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.centerLeft,
                                child: Text('NORMALE',style: TextStyle(
                                    color: AppTheme.primaryAccentColor,
                                    fontWeight: FontWeight.bold,)))),
                        GridTextColumn(
                            columnName: 'grasse',
                            width: 120,
                            label: Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.centerLeft,
                                child: Text('GRASSE',style: TextStyle(
                                  color: AppTheme.primaryAccentColor,
                                  fontWeight: FontWeight.bold,)))),
                        GridTextColumn(
                            columnName: 'seche',
                            width: 120,
                            label: Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.centerLeft,
                                child: Text('SÈCHE',style: TextStyle(
                                  color: AppTheme.primaryAccentColor,
                                  fontWeight: FontWeight.bold,)))),
                        GridTextColumn(
                            columnName: 'mixte',
                            width: 120,
                            label: Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.centerLeft,
                                child: Text('MIXTE',style: TextStyle(
                                  color: AppTheme.primaryAccentColor,
                                  fontWeight: FontWeight.bold,)))),
                        GridTextColumn(
                            columnName: 'senescente',
                            width: 120,
                            label: Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.centerLeft,
                                child: Text('SÉNESCENTE',style: TextStyle(
                                  color: AppTheme.primaryAccentColor,
                                  fontWeight: FontWeight.bold,)))),
                      ],
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  buildDrawerButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        MaterialButton(
          onPressed: () {
            final _state = _sideMenuKey.currentState;
            if (_state.isOpened)
              _state.closeSideMenu();
            else
              _state.openSideMenu();
          },
          height: 50.0,
          minWidth: 50.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Image.asset(
            AppStrings.home_icon,
            width: 50,
            height: 50,
          ),
        )
      ],
    );
  }
}
