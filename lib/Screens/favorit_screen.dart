import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:nurture_cosmetic/Models/Product.dart';
import 'package:nurture_cosmetic/Models/Session.dart';
import 'package:nurture_cosmetic/Models/User.dart';
import 'package:nurture_cosmetic/Utils/AppApi.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/Drawer.dart';
import 'package:nurture_cosmetic/Widgets/ProductListItem.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:nurture_cosmetic/Screens/details_screen.dart';
import 'package:http/http.dart' as http;

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() {
    return _FavoriteScreenState();
  }
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  User _currentUser;
  Session session;
  Connectivity connectivity;
  List<Product> _products;
  Future<List<Product>> _futureProducts;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    session = new Session();
    connectivity = new Connectivity();
    _currentUser = new User();
    setState(() {
      getCurrentUser();
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
                        "Vous trouvez ici vos produits favoris."),
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
                  /*  Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              AppNavigation.goToFilter(context);
                            },
                            child: Icon(
                              Icons.delete_forever,
                              color: AppTheme.primaryColor,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              AppNavigation.goToFilter(context);
                            },
                            child: Icon(
                              Icons.filter_list_outlined,
                              color: AppTheme.primaryColor,
                            )),
                      ],
                    )*/
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: FutureBuilder(
                      future: getFavorisProduct(),
                      builder: (context, projectSnap) {
                        if (projectSnap.hasData) {
                          //print(projectSnap.data[1]);
                          return ListView.builder(
                            padding: EdgeInsets.only(right: 6, left: 6),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: projectSnap.data.length,
                            itemBuilder: (context, index) {
                              Product product = projectSnap.data[index];
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => DetailsScreen(
                                                  id: product.id,
                                                )
                                            // MyApp(),
                                            ));
                                  },
                                  // onTap: () => AppNavigation.goToDetails(context,product.id),
                                  child: ProductListItem(product));
                            },
                          );
                        } else {
                          if(projectSnap.connectionState == ConnectionState.waiting){
                            return Center(child: CircularProgressIndicator());
                          }else{
                            return Text('No Favorite Found');
                          }


                        }
                      }),
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

  Future getCurrentUser() async {
    String tt;
    String url = AppConfig.URL_GET_CURRENT_CLIENT;
    await session.getToken().then((value) async {
      // Run extra code here
      tt = value;
    }, onError: (error) {
      print(error);
    });
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'auth': '$tt',
    });
    int statusCode = response.statusCode;

    Map<String, dynamic> data = jsonDecode(response.body);
    _currentUser = User.fromMap(data);
    return (Future(() => _currentUser));
    //updateNotification(_currentUser.phoneNumber);
  }

  Future<List<Product>> getFavorisProduct() async {
    String tt;
    String url = AppConfig.URL_GET_ALL_PRODUCT_FAVORIS;
    await session.getToken().then((value) async {
      // Run extra code here
      tt = value;
    }, onError: (error) {
      print(error);
    });
    int id;
    await getCurrentUser().then((value) => {
          id = value.id,
        });

    String body = '{"id":"$id"}';
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'auth': '$tt',
        },
        body: body);
    int statusCode = response.statusCode;
    List<dynamic> data = jsonDecode(response.body);
    _products = data.map((json) => Product.fromMap(json)).toList();

    return (Future(() => _products));
  }
}
