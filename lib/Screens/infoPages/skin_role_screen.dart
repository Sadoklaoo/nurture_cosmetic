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


class SkinRoleScreen extends StatefulWidget {
  @override
  _SkinRoleScreenState createState() {
    return _SkinRoleScreenState();
  }
}

class _SkinRoleScreenState extends State<SkinRoleScreen> with TickerProviderStateMixin {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  bool _showBackToTopButton = false;

  ScrollController _scrollController;
  final List<String> quoi_sert_list = [
    "Elle retient l’eau que renferme notre organisme",
    "Elle protège notre corps des agressions extérieures en amortissant les chocs et en protégeant des microbes ",
    "Elle assure un rôle de thermorégulation en maintenant notre organisme à une température d’environ 37 °C",
    "Elle constitue des réserves de sels minéraux, graisses, eau",
    "Elle épure les toxines telles la sueur, le sébum",
    "Elle contribue à la respiration, 1 gramme d’épiderme absorbe 1 litre d’oxygène pur par heure",
    "Elle transforme les rayons ultra-violets en vitamine D",
    "Elle est l’organe du sens du toucher grâce à ses millions de récepteurs sensoriels"
  ];

  final List<String> trois_couches = [
    "l’épiderme, la partie la plus superficielle de la peau ",
    "le derme, la couche la plus épaisse de la peau",
    "l’hypoderme, la couche la plus profonde de la peau.",
  ];
  final List<String> hypoderme = [
    "est constitué de tissus adipeux, une couche composée de graisse. "
        "La répartition et l’épaisseur de cette couche varie selon les habitudes alimentaires, les parties du corps et le sexe des individus.",
    "est un véritable isolant thermique et amortisseur de chocs",
  ];
  final List<String> derme = [
    "est la couche la plus épaisse de la peau, son épaisseur varie de 1 mm à 5 mm",
    "est constitué de 2 zones :  la zone réticulaire, la partie profonde du derme et la zone papillaire, la partie superficielle du derme",
    "englobe les glandes sudoripares (qui produisent la sueur), les glandes sébacées (qui produisent le sébum) et les follicules pileux (poils)",
    "englobe également les vaisseaux sanguins et lymphatiques, des fibroblastes qui sécrètent les fibres de collagène et d’élastine et enfin l’acide hyaluronique.",
    "constitué à 80 % d’eau, sert de réservoir à l’organisme et est responsable de l’hydratation de la peau",
  ];
  final List<String> epiderme = [
    "est très fin : 0,1 mm au niveau des paupières, 1 mm au niveau des paumes des pieds et des mains",
    "est recouvert d’un film hydrolipidique : un mélange de sueur et de sébum où se développent des micro-organismes, qui forme la flore cutanée.",
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
            child: Icon(Icons.arrow_upward,color: AppTheme.whiteColor,),
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
                              "Comprendre la peau pour mieux soigner la sienne",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryColor)),
                        ),
                        AppDesign.buildBlock(RichText(
                          text: TextSpan(
                              text:
                              'La peau est une enveloppe élastique qui recouvre l’ensemble du corps humain. Elle représente près de 15 % de notre poids total et est majoritairement, à 70 %, composée d’eau. Egalement composée de 27,5 % de protides, 2 % de lipides, 0,5 % de sels minéraux, c’est un système complexe à trois couches … ',
                              style: TextStyle(
                                fontFamily:'Nunito' ,
                                color: AppTheme.primaryColor,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                  'Et comprendre la peau, c’est essentiel pour mieux soigner la sienne !',
                                  style: TextStyle(
                                      fontFamily:'Nunito',
                                      color: AppTheme.primaryColor,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                        ),),
                        AppDesign.buildBlockTitleList(
                            "A quoi sert la peau ?",
                            "La peau assure plusieurs fonctions vitales :",
                            quoi_sert_list),
                        AppDesign.buildBlockTitleListImage(
                            "La peau est un système complexe à trois couches",
                            "La peau est constituée de trois couches :",
                            trois_couches,
                            "https://sauvonsnotrepeau.fr/wp-content/uploads/2016/05/Coupe-de-la-peau-.jpg","test"),
                        AppDesign.buildBlockTitleList(
                            "Comprendre l’hypoderme, la couche la plus profonde de la peau",
                            "L’hypoderme :",
                            hypoderme),
                        AppDesign.buildBlockTitleListText(
                            "Comprendre le derme, la couche centrale de la peau",
                            "Le derme, au centre, séparé de l’épiderme par la membrane basale :",
                            derme,
                            "L’élastine a la particularité d’offrir à la peau un degré d’élasticité et de souplesse important, lui permettant ainsi de revenir à un état initial lorsqu’elle subit une tension. L’acide hyaluronique a la particularité d’absorber 1000 fois son poids en eau."),
                        AppDesign.buildBlockTitleListText(
                            "Comprendre l’épiderme, la couche externe, en contact avec l’environnement",
                            "L’épiderme :",
                            epiderme,
                            "La quantité et la qualité de ce film hydrolipidique détermine en partie le type de peau. Cette couche grâce au phénomène de kératinisation se renouvelle constamment à un rythme en moyenne de 21 jours. Ce rythme ralentit avec l’âge."),
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
                                      "Le film hydrolipidique se renouvelle tous les 3 à 4 semaines",
                                      style: TextStyle(
                                          color: AppTheme.primaryAccentColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Les 4 couches de l’épiderme sont en éternel changement :",
                                      style: TextStyle(
                                        color: AppTheme.primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    AppDesign.buildItem(
                                        "La couche basale, la plus profonde,",
                                        "Elle est constituée d’une seule épaisseur de cellules. C’est dans cette zone à forte activité prolifératrice que sont produits les kératinocytes."),
                                    AppDesign.buildItem(
                                        "La couche épineuse, couche dans laquelle les cellules possédent des « épines » :",
                                        "Dans cette couche épineuse, les cellules de kératinocytes subissent des modifications : leur forme devient polyédrique, leur noyau est arrondi et leur cytoplasme plus foncé. Il est également possible d’observer des cellules de Langerhans au niveau de cette zone."),
                                    AppDesign.buildItem("La couche granuleuse :",
                                        "Les kératinocytes migrant dans cette troisième couche voient leur noyau et leur cytoplasme s’aplatir."),
                                    AppDesign.buildItem(
                                        "La couche cornée, couche la plus externe de l’épiderme :",
                                        "Les cellules de kératinocytes deviennent aplaties et perdent leur noyau. Ce sont des cellules mortes, appelées cornéocytes dont la cohésion est assurée par un cément. La couche cornée est très épaisse au niveau de la paume des pieds et des mains. Elle est formée de 2 sous couches : une compacte située en profondeur et une plus superficielle dans laquelle les cornéocytes desquament et se décollent de la peau."),
                                    Text(
                                      "Ce processus de kératinisation dure environ trois semaines et aboutit à la formation d’une couche protectrice, le film hydrolipidique, véritable barrière contre l’environnement extérieur et qui est en constant renouvellement.",
                                      style: TextStyle(
                                        color: AppTheme.primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    FullScreenWidget(
                                      child: Center(
                                        child: Hero(
                                          tag: "Skin",
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              child: Image.network(
                                                "https://sauvonsnotrepeau.fr/wp-content/uploads/2019/11/epiderme-coupe-couche-peau.jpg",
                                                fit: BoxFit.fitWidth,
                                              )),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )),
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
                                      "Kératinocytes et mélanocytes sont les 2 plus majeures populations de l’épiderme",
                                      style: TextStyle(
                                          color: AppTheme.primaryAccentColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Les 4 populations de l’épiderme :",
                                      style: TextStyle(
                                        color: AppTheme.primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    AppDesign.buildItem("Les kératinocytes,",
                                        "C\'est la première population de l’épiderme, Il existe trois familles de kératinocytes : les cellules souches, les cellules amplificatrices qui vont se diviser et les cellules destinées à demeurer dans la couche basale. Au cours de leur migration, les cellules de kératinocytes perdent leur fonction de prolifération et subissent des changements morphologiques et biochimiques. Entre les kératinocytes se trouvent des mélanocytes."),
                                    AppDesign.buildItem(
                                        "Les mélanocytes, deuxième population de l’épiderme,",
                                        "Les mélanocytes sont localisés au niveau de la membrane basale et des follicules pileux. Ces cellules émettent des prolongements leur permettant ainsi d’être en contact de nombreux kératinocytes. Leur rôle est d’assurer la synthèse de mélanine, pigment responsable de la coloration de la peau. Il y a environ 1000 à 1500 mélanocytes par millimètre carré sur le reste du corps, un peu plus, 2000 mélanocytes par millimètre carré sur le visage et ceci, quel que soit le type de peau."),
                                    Text(
                                      "Cette association mélanocytes / kératinocytes joue un rôle extrêmement important pour lutter contre les ultraviolets émis par les rayonnements du soleil. Un mélanocyte distribue de la mélanine aux 36 kératinocytes voisins.",
                                      style: TextStyle(
                                        color: AppTheme.primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    AppDesign.buildItem(
                                        "Les cellules de Langerhans, troisième population de l’épiderme,",
                                        "les cellules de Langerhans peu nombreuses représentent 3 à 8 % des cellules. Ces cellules ont pour fonction principale de participer aux défenses immunologiques de la peau."),
                                    AppDesign.buildItem(
                                        "La couche cornée, couche la plus externe de l’épiderme :",
                                        "Les cellules de kératinocytes deviennent aplaties et perdent leur noyau. Ce sont des cellules mortes, appelées cornéocytes dont la cohésion est assurée par un cément. La couche cornée est très épaisse au niveau de la paume des pieds et des mains. Elle est formée de 2 sous couches : une compacte située en profondeur et une plus superficielle dans laquelle les cornéocytes desquament et se décollent de la peau."),
                                    Text(
                                      "Cette association mélanocytes / kératinocytes joue un rôle extrêmement important pour lutter contre les ultraviolets émis par les rayonnements du soleil. Un mélanocyte distribue de la mélanine aux 36 kératinocytes voisins.",
                                      style: TextStyle(
                                        color: AppTheme.primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    AppDesign.buildItem(
                                        "Les cellules de Langerhans, troisième population de l’épiderme,",
                                        "les cellules de Langerhans peu nombreuses représentent 3 à 8 % des cellules. Ces cellules ont pour fonction principale de participer aux défenses immunologiques de la peau."),
                                    AppDesign.buildItem(
                                        "Les cellules de Merkel, quatrième et dernière population de l’épiderme,",
                                        "Situées à proximité de la membrane basale, ces cellules peu nombreuses jouent un rôle important au niveau de la perception du toucher, de la pression et de la douleur."),

                                  ],
                                ),
                              )),
                        )
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
