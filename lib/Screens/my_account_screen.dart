import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/Drawer.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class MyAccountScreen extends StatefulWidget {
  @override
  _MyAccountScreenState createState() {
    return _MyAccountScreenState();
  }
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
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
                      padding: const EdgeInsets.only(top:8.0),
                      child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.chevron_left,
                            size: 40,
                            color: AppTheme.primaryColor,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Center(
                        child: Text("Mon Compte",
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
                        "lorem ipsum is Simply dummy text of the printing and typesetting industry."),
                  ),
                ),
                SizedBox(
                  height: height * 2 / 100,
                ),
                Divider(),
                buildAccountButton(),
                buildPasswordButton(),
                buildHelpButton(),

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

  Widget buildAccountButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          leading: Container(

            decoration: BoxDecoration(
                color: AppTheme.primaryAccentColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2.0,
                    offset: Offset(0, 3),
                  ),
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Icons.person_pin,
                size: 30,
                color: AppTheme.whiteColor,
              ),
            ),
          ),
          title: Text(
            "Modifier profile",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryColor),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: AppTheme.primaryAccentColor,
          ),
        ),
      ),
    );
  }

  Widget buildPasswordButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          leading: Container(

            decoration: BoxDecoration(
                color: AppTheme.primaryAccentColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2.0,
                    offset: Offset(0, 3),
                  ),
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Icons.lock,
                size: 30,
                color: AppTheme.whiteColor,

              ),
            ),
          ),
          title: Text(
            "Changer mot de passe",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryColor),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: AppTheme.primaryAccentColor,
          ),
        ),
      ),
    );
  }

  Widget buildHelpButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          leading: Container(

            decoration: BoxDecoration(
                color: AppTheme.primaryAccentColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2.0,
                    offset: Offset(0, 3),
                  ),
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image(
                image: AssetImage('assets/images/antibacterial.png'),
                width: 30,
                height: 30,
              )
            ),
          ),
          title: Text(
            "Modifier allergies",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryColor),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: AppTheme.primaryAccentColor,
          ),
        ),
      ),
    );
  }



}
