import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nurture_cosmetic/Screens/take_screen.dart';
import 'package:nurture_cosmetic/Screens/result_details_screen.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/Drawer.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class SkipResultScreen extends StatefulWidget {
  @override
  _SkipResultScreenState createState() => _SkipResultScreenState();
}

class _SkipResultScreenState extends State<SkipResultScreen> {
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
          height: height,
          width: width,

          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 40.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: [

                    buildDrawerButton(height),
                  ],
                ),
                SizedBox(
                  height: height * 10 / 100,
                ),
                Image.asset(
                  "assets/images/res.png",
                  width: 200,
                  height: 200,
                ),
                SizedBox(
                  height: height * 5 / 100,
                ),
                Text(
                  'Résultat',
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: height * 5 / 100,
                ),
                Text(
                  'Votre type de peau est normale',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: height * 20 / 100,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSkipBtn(),
                    _buildTakeBtn()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildSkipBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => {
        Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => TakeScreen()
        ))
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: AppTheme.whiteColor,
        child: Text(
          'Refaire',
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
        onPressed: () => {
        Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ResultScreen()
        ))
        },
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
  buildDrawerButton(double height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        MaterialButton(
          onPressed: () {
            final _state = _sideMenuKey.currentState;
            if (_state.isOpened) {
              _state.closeSideMenu();
            } else {
              _state.openSideMenu();
            }
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
