import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/Drawer.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class ClaimsOptionsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends State<ClaimsOptionsScreen> {
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
                      child: Center(
                        child: Text("Réclamations",
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
                        "Ajouter des nouvelles réclamations ou visiualiser vos réclamations courrantes."),
                  ),
                ),
                SizedBox(
                  height: height * 2 / 100,
                ),
                Divider(),
                buildAccountButton(),
               // buildNotificationsButton(),
                buildHelpButton(),

               // buildTranslationsButton()
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
    return GestureDetector(
      onTap: () => AppNavigation.goToHelp(context),
      child: Padding(
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
                  Icons.add_circle,
                  size: 30,
                  color: AppTheme.whiteColor,
                ),
              ),
            ),
            title: Text(
              "Ajouter réclamation",
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
      ),
    );
  }

  Widget buildNotificationsButton() {
    return GestureDetector(
      onTap: () => AppNavigation.goToSettingsNotifications(context),
      child: Padding(
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
                  Icons.notifications_active_sharp,
                  size: 30,
                  color: AppTheme.whiteColor,

                ),
              ),
            ),
            title: Text(
              "Notifications",
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
      ),
    );
  }

  Widget buildHelpButton() {
    return GestureDetector(
      onTap: () => AppNavigation.goToMyClaims(context),
      child: Padding(
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
                  Icons.support,
                  size: 30,
                  color: AppTheme.whiteColor,

                ),
              ),
            ),
            title: Text(
              "Mes Réclamations",
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
      ),
    );
  }

  Widget buildTermsButton() {
    return GestureDetector(
      onTap: () => AppNavigation.goToTerms(context),
      child: Padding(
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
                  Icons.book_outlined,
                  size: 30,
                  color: AppTheme.whiteColor,

                ),
              ),
            ),
            title: Text(
              "Conditions et termes d'utilisations",
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
      ),
    );
  }

  Widget buildTranslationsButton() {
    return GestureDetector(
      onTap:() => AppNavigation.goToLanguage(context) ,
      child: Padding(
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
                  Icons.translate,
                  size: 30,
                  color: AppTheme.whiteColor,

                ),
              ),
            ),
            title: Text(
              "Traduction",
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
      ),
    );
  }

}