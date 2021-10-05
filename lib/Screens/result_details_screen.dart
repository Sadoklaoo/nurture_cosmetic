import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/Drawer.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
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
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Center(
                        child: Text("Résultat",
                            style: TextStyle(
                                fontSize: 25,
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
                        "Résultat detaillé de votre type de peau."),
                  ),
                ),
                SizedBox(
                  height: height * 2 / 100,
                ),
                Divider(),
                buildRow('assets/images/neturelle.png',"Nature de peau",0.5,"Trés seche", "Normal","Trés grasse"),
                SizedBox(
                  height: height * 2 / 100,
                ),
                buildRow('assets/images/hydra.png',
                    "Hydratation",
                    0.5,
                    "Trés désydraté",
                    "Normal",
                    "Hydraté"),
                SizedBox(
                  height: height * 2 / 100,
                ),
                buildRow('assets/images/imp.png',
                    "Imperfections",
                    0.5,
                    "Imperfections",
                    "Normal",
                    "Peau nette"),
                SizedBox(
                  height: height * 2 / 100,
                ),
                buildRow('assets/images/sens.png',
                    "Sensibilité",
                    0.5,
                    "Pas Sensible",
                    "Normal",
                    "Sensible"),
                SizedBox(
                  height: height * 2 / 100,
                ),
                buildRow('assets/images/eclat.png',
                    "Eclat",
                    0.5,
                    "Teint terne",
                    "Normal",
                    "Teint lumineux"),
                SizedBox(
                  height: height * 2 / 100,
                ),
                buildRow('assets/images/age.png',
                    "Anti-âge",
                    0.5,
                    "Peau jeune",
                    "",
                    "Peau mature"),

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

  buildRow(String image,String Title,double progress,String first, String second,String third){
   return Row(
      children: [
        //Icon
        Container(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(image,  width: 50,
                height: 50,)
          ),
          decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(15)
          ),
        ),
        SizedBox(width: 15,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(Title,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryAccentColor)),
            SizedBox(height: 5,),
            //Progress Bar
            new LinearPercentIndicator(
              width: 250.0,
              lineHeight: 20.0,
              percent: progress,
              backgroundColor: AppTheme.greyWhiteColor,
              progressColor: AppTheme.primaryAccentColor,
            ),
            SizedBox(height: 5,),
            //Progressbar setts
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                Text(first,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor)),
                SizedBox(width: 30,),
                Text(second,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor)),
                SizedBox(width: 30,),
                Text(third,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor)),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _buildSkipBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => AppNavigation.goToHome(context),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: AppTheme.whiteColor,
        child: Text(
          'Suivant',
          style: TextStyle(
            color: AppTheme.primaryColor,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
  Widget _buildTakeBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),

      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => AppNavigation.goToTake(context),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: AppTheme.primaryAccentColor,
        child: Text(
          'En détails',
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

}
