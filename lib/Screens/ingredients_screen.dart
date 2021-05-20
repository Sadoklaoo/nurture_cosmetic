import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/Drawer.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:nurture_cosmetic/Widgets/IngredientsListWidget.dart';
class IngredientsScreen extends StatefulWidget {
  @override
  _IngredientsScreenState createState() {
    return _IngredientsScreenState();
  }
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

  final Map<String, String> ingredientList = {
  'ALCOHOL':'neutre',
    'PARFUM (FRAGRANCE)':'neutre',
    'AQUA (WATER)':'neutre',
    'LIMONENE':'LOW',
    'LINALOOL':'LOW',
    'BUTYL METHOXYDIBENZOYLMETHANE':'neutre',
    'COUMARIN':'HIGH',
    'CITRONELLOL':'MEDIUM',
    'HYDROXYCITRONELLAL':'HIGH',
    'GERANIOL':'HIGH',
    'CITRAL':'HIGH',
    'ALPHA-ISOMETHYL IONONE':'LOW',
    'BENZYL BENZOATE':'LOW',
    'PENTAERYTHRITYL TETRA-DI-T-BUTYL HYDROXYHYDROCINNAMATE':'neutre',
    'CINNAMAL':'HIGH',
    'EUGENOL':'HIGH',
    'BENZYL ALCOHOL':'LOW',
    'FARNESOL':'HIGH',
    'BENZYL SALICYLATE':'LOW',
    'CI 17200 (RED 33)':'neutre',
    'CI 47005 (YELLOW 10)':'neutre',
    'CI 60730 (EXT. VIOLET 2)':'neutre'
};


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return SideMenu(
      background: AppTheme.primaryColor,
      key: _sideMenuKey,
      menu: buildMenu(context),
      type: SideMenuType.slideNRotate,
      child: Scaffold(
        backgroundColor: AppTheme.primaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 40.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 20),
                      child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.chevron_left,
                            size: 40,
                            color: AppTheme.whiteColor,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Center(
                        child: Text("Ingrédients",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: AppTheme.whiteColor)),
                      ),
                    ),
                    buildDrawerButton(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Divider(
                    color: AppTheme.whiteColor,
                  ),
                ),
                SizedBox(
                  height: height * 2 / 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    "GUERLAIN SHALIMAR",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: AppTheme.whiteColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    "Eau de parfum",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20.0,
                        color: AppTheme.whiteColor),
                  ),
                ),
                SizedBox(
                  height: height * 5 / 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            'Dimensions',
                            style: TextStyle(
                                color: AppTheme.whiteColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            '4x5x6 inches',
                            style: TextStyle(
                                color: AppTheme.whiteColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                                onTap: () => {Navigator.pop(context)},
                                child:
                                Image.asset("assets/images/right_icon_btn.png")),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Détails",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.0,
                                  color: AppTheme.whiteColor),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Image.asset(
                      "assets/images/prod_image_right.png",
                      width: width * 50 / 100,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    "La list d\'ingrédients",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                        color: AppTheme.whiteColor),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: IngredientsList(ingredientList),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    "Ce produit représente plusieurs allergènes faibles, moyennes et fortes. ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                        color: AppTheme.whiteColor),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }


  buildDrawerButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          MaterialButton(
            onPressed: () {},
            height: 50.0,
            minWidth: 50.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: FaIcon(
              FontAwesomeIcons.heart,
              color: AppTheme.whiteColor,
            ),
          )
        ],
      ),
    );
  }


}