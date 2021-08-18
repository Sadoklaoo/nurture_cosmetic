import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/Drawer.dart';
import 'package:nurture_cosmetic/Widgets/ProductListItem.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() {
    return _FavoriteScreenState();
  }
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SideMenu(
      background: AppTheme.primaryColor,
      key: _sideMenuKey,
    //  menu: buildMenu(context),
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
                      padding: const EdgeInsets.only(top:8.0),
                      child: Center(
                        child: Text("Favoris",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mes Favoris",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: AppTheme.primaryColor),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              AppNavigation.goToFilter(context);
                            },
                            child: Icon(
                              Icons.delete_forever,
                              color: AppTheme.primaryColor,
                            )),
                        SizedBox(width: 10,),
                        GestureDetector(
                            onTap: () {
                              AppNavigation.goToFilter(context);
                            },
                            child: Icon(
                              Icons.filter_list_outlined,
                              color: AppTheme.primaryColor,
                            )),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: SizedBox(
                    height: height *60 /100 ,
                      child: ListView.builder(
                        padding: EdgeInsets.only(right: 6, left: 6),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductListItem(null);
                        },
                      )),
                ),
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





}
