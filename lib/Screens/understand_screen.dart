import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/Drawer.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:dynamic_treeview/dynamic_treeview.dart';
import 'package:nurture_cosmetic/Widgets/DataModel.dart';

class UnderstandScreen extends StatefulWidget {
  @override
  _UnderstandScreenState createState() {
    return _UnderstandScreenState();
  }
}

class _UnderstandScreenState extends State<UnderstandScreen> {
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
                      child: Center(
                        child: Text("Comprendre",
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
                      parentTextStyle:
                      TextStyle(color: AppTheme.primaryColor, fontSize: 18, fontWeight: FontWeight.w800),
                      rootId: "1",
                      childrenTextStyle: TextStyle(color: AppTheme.primaryColor, fontSize: 15),
                      parentPaddingEdgeInsets:
                      EdgeInsets.only(left: 16, top: 0, bottom: 0)),
                  onTap: (m) {
                   // print("onChildTap -> $m");
                   // print(m.values.first);
                    AppNavigation.goToInfo(context, m.values.first);
                  },
                  width: MediaQuery.of(context).size.width *90/100,
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
      DataModel(
        id: 2,
        name: 'La peau',
        parentId: 1,
        extras: {'key': 'extradata2'},
      ),
      DataModel(
        id: 3,
        name: 'Role et composition',
        parentId: 2,
        extras: {'key': 'extradata3'},
      ),
      DataModel(
        id: 4,
        name: 'Type de peau',
        parentId: 2,
        extras: {'key': 'extradata4'},
      ),
      DataModel(
        id: 5,
        name: 'Déterminer son type de peau',
        parentId: 2,
        extras: {'key': 'extradata5'},
      ),

      DataModel(
        id: 6,
        name: 'Phototype de peau',
        parentId: 2,
        extras: {'key': 'extradata6'},
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
}
