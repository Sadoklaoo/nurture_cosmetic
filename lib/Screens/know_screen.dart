import 'package:dynamic_treeview/dynamic_treeview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/Drawer.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:nurture_cosmetic/Widgets/DataModel.dart';

class KnowScreen extends StatefulWidget {
  @override
  _KnowScreenState createState() {
    return _KnowScreenState();
  }
}

class _KnowScreenState extends State<KnowScreen> {
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
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Center(
                        child: Text("(Re)Connaitre",
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
                DynamicTreeView(
                  data: getData(),
                  config: Config(
                      parentTextStyle: TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                      rootId: "1",
                      childrenTextStyle:
                          TextStyle(color: AppTheme.primaryColor, fontSize: 15),
                      parentPaddingEdgeInsets:
                          EdgeInsets.only(left: 16, top: 0, bottom: 0)),
                  onTap: (m) {
                    print("onChildTap -> $m");
                  },
                  width: MediaQuery.of(context).size.width * 90 / 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<BaseData> getData() {
    return [
      DataModel(
        id: 1,
        name: 'Root',
        parentId: -1,
        extras: {'key': 'extradata1'},
      ),
      /*Les Allergenes*/
      DataModel(
        id: 2,
        name: 'Les allergènes',
        parentId: 1,
        extras: {'key': 'extradata2'},
      ),
      DataModel(
        id: 3,
        name: 'Les 26 allergènes réglementés',
        parentId: 2,
        extras: {'key': 'extradata3'},
      ),
      DataModel(
        id: 4,
        name: 'Le butylphenyl methylpropional',
        parentId: 2,
        extras: {'key': 'extradata4'},
      ),
      DataModel(
        id: 5,
        name: 'Le lyral',
        parentId: 2,
        extras: {'key': 'extradata5'},
      ),
      /*Les Allergenes*/
      /*Les Composants*/
      DataModel(
        id: 6,
        name: 'Les composants décriés',
        parentId: 1,
        extras: {'key': 'extradata6'},
      ),
      DataModel(
        id: 7,
        name: 'Les tensioactifs',
        parentId: 6,
        extras: {'key': 'extradata7'},
      ),
      DataModel(
        id: 8,
        name: 'Les types de tensioactifs',
        parentId: 7,
        extras: {'key': 'extradata8'},
      ),
      DataModel(
        id: 9,
        name: 'Le sodium lauryl sulfate',
        parentId: 7,
        extras: {'key': 'extradata9'},
      ),
      DataModel(
        id: 10,
        name: 'Les quaterniums',
        parentId: 7,
        extras: {'key': 'extradata10'},
      ),
      DataModel(
        id: 11,
        name: 'Les alkylphenols',
        parentId: 7,
        extras: {'key': 'extradata11'},
      ),
      DataModel(
        id: 12,
        name: 'Les silicones',
        parentId: 6,
        extras: {'key': 'extradata12'},
      ),
      DataModel(
        id: 13,
        name: 'Les huiles minérales',
        parentId: 6,
        extras: {'key': 'extradata13'},
      ),
      DataModel(
        id: 14,
        name: 'Les phtalates',
        parentId: 6,
        extras: {'key': 'extradata14'},
      ),
      DataModel(
        id: 15,
        name: 'Le diethylphtalate (DEP)',
        parentId: 14,
        extras: {'key': 'extradata15'},
      ),
      DataModel(
        id: 15,
        name: 'Les emballages',
        parentId: 14,
        extras: {'key': 'extradata16'},
      ),
      DataModel(
        id: 16,
        name: 'Les filtres solaires',
        parentId: 6,
        extras: {'key': 'extradata16'},
      ),
      DataModel(
        id: 17,
        name: 'Leurs dangers',
        parentId: 16,
        extras: {'key': 'extradata17'},
      ),
      DataModel(
        id: 18,
        name: 'Les filtres solaires autorisés',
        parentId: 16,
        extras: {'key': 'extradata18'},
      ),
      DataModel(
        id: 19,
        name: 'Les sels d\'aluminium',
        parentId: 6,
        extras: {'key': 'extradata19'},
      ),
      /*Les Composants*/
      /*Les Aditifs*/
      DataModel(
        id: 20,
        name: 'Les aditifs controversés',
        parentId: 1,
        extras: {'key': 'extradata20'},
      ),
      DataModel(
        id: 21,
        name: 'Les conservateurs',
        parentId: 20,
        extras: {'key': 'extradata21'},
      ),
      DataModel(
        id: 22,
        name: 'Les parabènes',
        parentId: 21,
        extras: {'key': 'extradata22'},
      ),
      DataModel(
        id: 23,
        name: 'Le méthylisothiazolinone',
        parentId: 21,
        extras: {'key': 'extradata23'},
      ),
      DataModel(
        id: 24,
        name: 'Le phénoxyéthanol',
        parentId: 21,
        extras: {'key': 'extradata24'},
      ),
      DataModel(
        id: 25,
        name: 'BHA & BHT',
        parentId: 21,
        extras: {'key': 'extradata25'},
      ),
      DataModel(
        id: 26,
        name: 'Le formaldéhyde',
        parentId: 21,
        extras: {'key': 'extradata26'},
      ),
      DataModel(
        id: 27,
        name: 'Le triclosan',
        parentId: 21,
        extras: {'key': 'extradata27'},
      ),
      DataModel(
        id: 28,
        name: 'Les PEG & PPG',
        parentId: 20,
        extras: {'key': 'extradata28'},
      ),
      DataModel(
        id: 29,
        name: 'L\'EDTA',
        parentId: 20,
        extras: {'key': 'extradata29'},
      ),
      DataModel(
        id:30,
        name: 'La para-phénylènediamine (PPD)',
        parentId: 20,
        extras: {'key': 'extradata30'},
      ),

      /*Les Aditifs*/
      DataModel(
        id:31,
        name: 'Les savons industriels',
        parentId: 1,
        extras: {'key': 'extradata31'},
      ),
      DataModel(
        id:32,
        name: 'Les savons industriels',
        parentId: 31,
        extras: {'key': 'extradata32'},
      ),
      DataModel(
        id:33,
        name: 'Les emballages plastiques',
        parentId: 1,
        extras: {'key': 'extradata33'},
      ),
      DataModel(
        id:34,
        name: 'Les emballages plastiques',
        parentId: 33,
        extras: {'key': 'extradata34'},
      ),
    ];
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
      onTap: () => AppNavigation.goToMyAccount(context),
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
                  ]),
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
              "Mon Compte",
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
                  ]),
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
                  ]),
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
              "Réclamations",
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
                  ]),
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
      onTap: () => AppNavigation.goToLanguage(context),
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
                  ]),
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
