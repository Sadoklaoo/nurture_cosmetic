import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/Drawer.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class TermsScreen extends StatefulWidget {
  @override
  _TermsScreenState createState() {
    return _TermsScreenState();
  }
}

class _TermsScreenState extends State<TermsScreen> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();


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
     //   menu: buildMenu(context),
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
                          child: Text("Termes & conditions",
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
                  buildPoliticCenter(),
                  buildServiceCenter()
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

  Widget buildPoliticCenter() {
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
                  '1. Politique de confidentialité',
                  style: TextStyle(
                      color: AppTheme.primaryAccentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed mollis neque sed nibh pretium, vitae finibus magna tempus. Praesent gravida maximus justo id vehicula. Duis sed dapibus sem. Donec nulla est, volutpat eu eros id, auctor mattis ante. Vestibulum efficitur, mi ac ultrices venenatis, nunc justo luctus leo, in accumsan magna augue id leo. Sed at vehicula magna, ac volutpat nisi. In ut tellus eros. Sed eget arcu eu nulla malesuada laoreet.',
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      ),
                ),
              ],
            ),
          )),
    );
  }

  Widget buildServiceCenter() {
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
                  '2. Qui peut utiliser notre service ?',
                  style: TextStyle(
                      color: AppTheme.primaryAccentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed mollis neque sed nibh pretium, vitae finibus magna tempus. Praesent gravida maximus justo id vehicula. Duis sed dapibus sem. Donec nulla est, volutpat eu eros id, auctor mattis ante. Vestibulum efficitur, mi ac ultrices venenatis, nunc justo luctus leo, in accumsan magna augue id leo. Sed at vehicula magna, ac volutpat nisi. In ut tellus eros. Sed eget arcu eu nulla malesuada laoreet.',
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
