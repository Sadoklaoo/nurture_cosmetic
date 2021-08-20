import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/Drawer.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:nurture_cosmetic/Widgets/UnorderedListWidget.dart';
import 'package:nurture_cosmetic/Utils/AppDesign.dart';

class SkinTypeScreen extends StatefulWidget {
  @override
  _SkinTypeScreenState createState() {
    return _SkinTypeScreenState();
  }
}

class _SkinTypeScreenState extends State<SkinTypeScreen>
    with TickerProviderStateMixin {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  bool _showBackToTopButton = false;

  ScrollController _scrollController;

  final List<String> surface = [
    "Le sébum forme un film protecteur à la surface de la peau, qui empêche l’eau de s’évaporer et permet de lutter contre les germes pathogènes.",
    "La sueur permet en premier lieu d’éliminer la chaleur, l’hydratation de la peau et de l’équilibre de la flore cutanée.",
  ];
  final List<String> seche = [
    "Elle est rêche au toucher",
    "Elle tiraille, en particulier après la toilette",
    "Elle desquame très facilement",
    "Elle est sensible aux changements climatiques : chaud, froid, vent",
  ];
  final List<String> grasse = [
    "des brillances",
    "une peau épaisse et terne",
    "des pores dilatés",
    "la présence de nombreux comédons (points noirs)",
  ];
  final List<String> grasse_raisons = [
    "des raisons hormonales",
    "à cause de la pollution",
    "dans des périodes de stress",
    "en raison de l’utilisation de produits cosmétiques trop décapants",
  ];
  final List<String> mixte = [
    "une peau grasse sur la zone médiane ou zone T : le front, le nez et le menton, avec des brillances et des points noirs",
    "une peau normale ou sèche sur les joues",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                              "Les 4 différents types de peau et ses divers états",
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
                                    'Le type de peau varie en fonction de son âge et sa santé, du climat et de la pollution ambiante de sa zone de vie et de son hygiène de vie. Il est essentiel de ',
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  color: AppTheme.primaryColor,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'connaître son type de peau',
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        color: AppTheme.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text:
                                        ' pour mieux la nettoyer et surtout mieux soigner sa peau. Quels sont les',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' différents types de peau ?',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        AppDesign.buildBlockTitleListText(
                            "Les 4 différents types de peau",
                            "La surface de la peau est recouverte d’un film hydro-lipidique, mélange de sueur et de sébum :",
                            surface,
                            "La quantité et la qualité du film hydro-lipidique déterminent le type de peau. On distingue quatre grands types de peau : normale, sèche, grasse et mixte. Parallèlement, la peau peut être sensible, déshydratée ou mature."),
                        AppDesign.buildNormalBlock(
                            "La peau normale : le type de peau idéal",
                            "La peau normale est la peau idéale. Ni trop grasse, ni trop sèche, la peau normale est confortable, ne brille pas, ne tiraille pas, ne rougit pas aux changements soudains de température. Elle est souvent le résultat d’une hygiène de vie saine et équilibrée. La peau normale a besoin de peu de produits cosmétiques."),
                        AppDesign.buildBlockTitleListText(
                            "La peau sèche : un type de peau inconfortable",
                            "La peau sèche manque de lipides, autrement dit de sébum, ce qui facilite l’évaporation de l’eau. La peau sèche a donc besoin d’être nourrie et ne doit pas être confondue avec la peau déshydratée. La sécheresse cutanée se manifeste souvent sur la peau du visage, des jambes et des mains :",
                            seche,
                            "Avec le vieillissement, la peau sèche se traduit souvent par des rides fines assez nombreuses."),
                        AppDesign.buildBlockTitle2ListText(
                            "La peau grasse : le type de peau le plus courant",
                            "La peau grasse s’explique par un excès de sébum, appelé séborrhée. Elle se manifeste surtout sur le visage et le haut du dos et se caractérise par :",
                            grasse,
                            "La peau peut devenir grasse pour différentes raisons :",
                            grasse_raisons,
                            "Avec le vieillissement, la peau grasse présente généralement peu de rides mais profondes et marquées."),
                        AppDesign.buildBlockTitleListText(
                            "La peau mixte : mélange de deux types de peau",
                            "La peau mixte est le mélange de deux types de peau et se caractérise par :",
                            mixte,
                            "C’est une peau difficile à traiter car elle demande souvent des produits adaptés à ces deux types de peau."),
                        Divider(),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 10.0, top: 10.0),
                          child: Text("Divers états de la peau",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryColor)),
                        ),
                        AppDesign.buildNormalBlockMultiple(
                          "La peau sensible : un état de peau réactive",
                          RichText(
                            text: TextSpan(
                                text: 'La peau sensible réagit excessivement ',
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  color: AppTheme.primaryColor,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'aux agressions extérieures :',
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        color: AppTheme.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text:
                                        '\npollution, chaud, froid, vent … Elle peut être associée à une peau sèche, une peau grasse ou une peau mixte.',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\nLa peau réactive ',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'a tendance à rougir',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        ', en particulier au niveau des joues, elle peut ',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'démanger ',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'ou ',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'brûler.',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '\nLa prise de médicaments, le stress, l’utilisation de produits cosmétiques mal adaptés peut entraîner une sensibilité cutanée.',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        AppDesign.buildNormalBlockMultiple(
                          "La peau déshydratée : un état de peau passager",
                          RichText(
                            text: TextSpan(
                                text:
                                    'La peau déshydratée est une peau qui manque d’eau. ',
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  color: AppTheme.primaryColor,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        '\nTout type de peau peut avoir la peau déshydratée. Cet état est souvent ',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'temporaire ',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'et se traduit par des ridules de déshydratation, un effet papier froissé lorsque l’on pince légèrement la peau.',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        AppDesign.buildNormalBlock(
                            "La peau mature : un état de peau qui dure !!!",
                            "La peau mature est ridée et souvent relâchée. La peau a perdu au fil des ans de sa tonicité et de sa fermeté.")
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
