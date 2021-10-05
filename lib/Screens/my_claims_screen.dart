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

class MyClaimsScreen extends StatefulWidget {
  @override
  _MyAllergyScreenState createState() {
    return _MyAllergyScreenState();
  }
}

class _MyAllergyScreenState extends State<MyClaimsScreen> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

  List<Map> allergies = [
    {
      'id': '1',
      'state': "PENDING",
      'type': "Suggestion",
      'date':"2021-07-13T10:40:40.680Z",
      'description': 'Ajouter QR Code',
      'selected': true
    },
    {
      'id': '2',
      'state': "DECLINED",
      'type': "Autre",
      'date':"2021-07-13T10:40:40.680Z",
      'description': 'Ajouter d\'autres marques',
      'selected': true
    },
    {
      'id': '3',
      'state': "PENDING",
      'type': "Bug",
      'date':"2021-07-13T10:40:40.680Z",
      'description':
          'Application crashe',
      'selected': true
    },
    {
      'id': '4',
      'state': "ACCEPTED",
      'type': "Bug",
      'date':"2021-07-13T10:40:40.680Z",
      'description':
          'Liste favoris ne marche pas',
      'selected': true
    },
    {
      'id': '5',
      'state': "PENDING",
      'type': "Bug",
      'date':"2021-09-13T11:45:40.680Z",
      'description':
      'App compliqué',
      'selected': true
    },
  ];

  int selectedSize = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.allergies.forEach((element) {
      if (element['selected'] == true) {
        selectedSize++;
      }
    });
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
                        child: Text("Mes réclamations",
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
                    child: Text("Visualiser vos réclamations."),
                  ),
                ),
                SizedBox(
                  height: height * 2 / 100,
                ),
                Divider(),
                SizedBox(
                  height: height * 1 / 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mes réclamations",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryColor),
                    ),

                  ],
                ),
                SizedBox(
                  height: height * 2 / 100,
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
                    if (p['selected'] == true) {
                      return _buildListItem(
                          p['type'], p['description'], p['state'], p['date']);
                    } else {
                      index++;
                    }
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

  Widget _buildListItem(
      String title, String description, String state, String date) {
    var icon;
    if (state == "PENDING") {
      icon = Icon(
        Icons.access_time,
        color: AppTheme.amberColor,
      );
    } else if (state == "DECLINED") {
      icon = Icon(
        Icons.cancel,
        color: AppTheme.redColor,
      );
    } else {
      icon = Icon(
        Icons.check_circle,
        color: AppTheme.greenColor,
      );
    }
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppTheme.primaryColor),
                ),
                Text(
                  DateFormat.yMd().add_jm().format(AppUtils.convertStringToDateTime(date)),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                      color: AppTheme.primaryColor),
                ),
              ],
            ),
            trailing: icon,
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
            ),
          ),
        ),
      ),
    );
  }
}
