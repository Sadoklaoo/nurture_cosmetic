import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Utils/AppUtils.dart';
import 'package:nurture_cosmetic/Widgets/Drawer.dart';
import 'package:nurture_cosmetic/Widgets/TextFieldWidget.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class SelectAllergyScreen extends StatefulWidget {
  @override
  _SelectAllergyScreenState createState() {
    return _SelectAllergyScreenState();
  }
}

class _SelectAllergyScreenState extends State<SelectAllergyScreen> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

  List<Map> allergies = [
    {
      'id': '1',
      'image': AppStrings.fragance_icon,
      'name': "Fragences",
      'description': 'Odeur du parfum',
      'selected': false
    },
    {
      'id': '2',
      'image': AppStrings.biocides_icon,
      'name': "Biocides",
      'description': 'Détruire les organismes nuisibles.',
      'selected': false
    },
    {
      'id': '3',
      'image': AppStrings.antioxydants_icon,
      'name': "Antioxydants",
      'description':
          'Protègent les produits contre la dégradation des acides gras insaturés.',
      'selected': false
    },
    {
      'id': '4',
      'image': AppStrings.uv_icon,
      'name': "Absorbants d'UV",
      'description':
          'Responsables d\'allergies de contact et de dermatites photosensibles.',
      'selected': false
    },
    {
      'id': '5',
      'image': AppStrings.glycerine_icon,
      'name': "Glycérine et glycols",
      'description': 'Fréquemment responsables de phénomènes irritatifs.',
      'selected': false
    },
    {
      'id': '6',
      'image': AppStrings.sheep_icon,
      'name': "Lanoline",
      'description':
          'Lorsqu\'elle entre dans la composition des médicaments d’application locale, la lanoline est fréquemment sensibilisante.',
      'selected': false
    },
    {
      'id': '7',
      'image': AppStrings.honey_icon,
      'name': "Propolis",
      'description':
          'Il s’agit d’une résine végétale, recueillie par les abeilles à partir de certains végétaux.',
      'selected': false
    },
  ];

  int selectedSize = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();



  }

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
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
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
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Center(
                        child: Text("Choisi vos allergènes",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: AppTheme.primaryColor)),
                      ),
                    ),

                  ],
                ),

                SizedBox(
                  height: height * 1 / 100,
                ),

                Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(right: 6, left: 6),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      itemCount: selectedSize,
                      itemBuilder: (BuildContext context, int index) {
                       Map p = this.allergies.elementAt(index);
                       return _buildListItem(p,p['name'],p['description'],p['image'],p['selected']);


                      },
                    )),
              ],
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

  Widget _buildListItem(Map p ,String title, String description, String image,bool val) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: AppTheme.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: CheckboxListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppUtils.capitalizeSentence(title),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor),
                ),
              ],
            ),
            secondary: Container(child: Image.asset(image)),
            subtitle: Row(
              children: [
                Flexible(
                  child: AutoSizeText(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppTheme.primaryColor),
                  ),
                ),
              ],

            ), value: val,selected: true,activeColor: AppTheme.primaryColor,
          onChanged: (bool value) { p["selected"]=value; },),
      ),
    );
  }
}