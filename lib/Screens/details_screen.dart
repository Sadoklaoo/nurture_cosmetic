import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nurture_cosmetic/Models/Cat.dart';
import 'package:nurture_cosmetic/Models/Product.dart';
import 'package:nurture_cosmetic/Models/Session.dart';
import 'package:nurture_cosmetic/Models/User.dart';
import 'package:nurture_cosmetic/Utils/AppApi.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/Drawer.dart';
import 'package:nurture_cosmetic/Widgets/NotificationListItem.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'ingredients_screen.dart';

class DetailsScreen extends StatefulWidget {
  final int id;
  DetailsScreen({@required this.id});
  @override
  _DetailsScreenState createState() {
    return _DetailsScreenState();
  }
}

class _DetailsScreenState extends State<DetailsScreen> {
  Session session;
  int id;
  Connectivity connectivity;
  Product product;
  User _currentUser;
  var icon = FontAwesomeIcons.heart;
  bool isFavorit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    session = new Session();
    connectivity = new Connectivity();
    _currentUser = new User();
    setState(() {
      getCurrentUser();
      insertHistory(widget.id);
    });
  }

  Future getProductDetail(int id) async {
    String tt;

    String url = AppConfig.URL_GET_ALL_PRODUCT_DETAILS + id.toString();
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
    product = Product.fromMap(data);
    //  print(product);
    return (Future(() => product));
    //updateNotification(_currentUser.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    //print(this.product);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.0,
          vertical: 40.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 20),
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
                      child: Text("Détails",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.primaryColor)),
                    ),
                  ),
                  buildDrawerButton(product),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Divider(),
              ),
              SizedBox(
                height: height * 2 / 100,
              ),
              _buildDetails(widget.id, height, width)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetails(int id, double height, double width) {
    return Container(
      child: FutureBuilder(
          future: getProductDetail(id),
          builder: (context, projectSnap) {
            if (projectSnap.hasData) {
              Product product = projectSnap.data;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      product.ProductName,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: AppTheme.primaryColor),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: buildCategories(product.Categories)
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppTheme.primaryAccentColor,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Text(
                              product.Price.toString() + " TND",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: AppTheme.whiteColor),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppTheme.amberColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 3.0),
                                    child: Text(
                                      product.Rank.toString() + "/20",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: AppTheme.whiteColor),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: GestureDetector(
                                        onTap: () => {},
                                        child: FaIcon(
                                          FontAwesomeIcons.infoCircle,
                                          color: AppTheme.whiteColor,
                                          size: 18,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  buildCompatibleField(),
                  SizedBox(
                    height: height * 1 / 100,
                  ),
                  _buildTypes(product.types),

                  SizedBox(
                    height: height * 3 / 100,
                  ),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/backproduct.png',
                            width: width * 50 / 100,
                          ),
                          Image.network(
                            AppConfig.URL_GET_IMAGE + product.Image,
                            width: width * 60 / 100,
                          ),
                        ],
                      ),

                      Flexible(
                        fit: FlexFit.tight,
                        child: AutoSizeText(
                          product.ProductShortDescription,
                          maxLines: 20,
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: AppTheme.primaryColor),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      int s = 0;
                      if (details.delta.dx < -s) {


                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: IngredientsScreen(
                                  product: product,
                                )));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Plus d\'informations",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15.0,
                              color: AppTheme.primaryColor),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {},
                            child:
                                Image.asset("assets/images/left_info_btn.png")),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      product.usingAdvice,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0,
                          color: AppTheme.primaryColor),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Produits Similaires",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: AppTheme.primaryColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: _buildSugguestions(),
                  )
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
  buildCategories(List<Cat> categories) {
    var categoriesNames = "";
    if (categories.length != 0) {
      categoriesNames = categories[0].categoryName;
      if (categories.length > 1) {

        var i = 0;
        categories.forEach((element) {
          if(i > 0){
            categoriesNames +=", "+element.categoryName;
          }
          i++;
        });
      }
      return Row(
        children: [
          Flexible(
            child: AutoSizeText(
              categoriesNames,
              maxLines: 2,
              overflow: TextOverflow.visible,
              softWrap: true,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryColor),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildTypes(List list) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
      child: SizedBox(
        height: 22.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, i) {
            if (i == 0) {
              return Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      list[i].TypeName,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                          color: AppTheme.whiteColor),
                    ),
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      list[i].TypeName,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                          color: AppTheme.whiteColor),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                product.types[1].TypeName,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: AppTheme.whiteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSugguestions() {
    return DefaultTabController(
        length: 3, // length of tabs
        initialIndex: 0,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: TabBar(
                  isScrollable: true,
                  unselectedLabelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  labelColor: AppTheme.primaryColor,
                  unselectedLabelColor: AppTheme.greyColor,
                  indicatorColor: Colors.transparent,
                  labelPadding: EdgeInsets.only(left: 15),
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(text: 'Populaire'),
                    Tab(text: 'Nouveau'),
                    Tab(text: 'Récommandé'),
                  ],
                ),
              ),
              Container(
                  height: 200, //height of TabBarView
                  color: AppTheme.darkBlueColor,
                  child: TabBarView(children: <Widget>[
                    Container(
                      child: Center(
                        child: Text('Display Tab 1',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text('Display Tab 2',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text('Display Tab 3',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ]))
            ]));
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

  insertHistory(int productid) async {
    String tt;
    int id;
    String url = AppConfig.URL_ADD_TO_HISTORY;
    await session.getToken().then((value) async {
      // Run extra code here
      tt = value;
    }, onError: (error) {
      print(error);
    });
    await getCurrentUser().then((value) => {
      id = value.id,
    });
    print(id);
    String body = '{"clientId":"$id","ProductId":"$productid"}';
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'auth': '$tt',
        },
        body: body);
    int statusCode = response.statusCode;
    bool isFavoris = false;
    if (statusCode == 201) {
      isFavoris = true;
      print('inserted');
    }

    return isFavoris;
  }

  Future<bool> isProductFavorite(int productid) async {
    String tt;
    int id;
    String url = AppConfig.URL_IS_PRODUCT_FAVORIS;
    await session.getToken().then((value) async {
      // Run extra code here
      tt = value;
    }, onError: (error) {
      print(error);
    });
    await getCurrentUser().then((value) => {
          id = value.id,
        });
    print(id);
    String body = '{"id":"$id","idProduct":"$productid"}';
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'auth': '$tt',
        },
        body: body);
    int statusCode = response.statusCode;
    bool isFavoris = false;
    if (statusCode == 200) {
      isFavoris = true;
    }

    return isFavoris;
  }

  Future<bool> isProductCompatible(int productid) async {
    String tt;
    int id;
    String url = AppConfig.URL_IS_PRODUCT_COMPATIBLE;
    await session.getToken().then((value) async {
      // Run extra code here
      tt = value;
    }, onError: (error) {
      print(error);
    });
    await getCurrentUser().then((value) => {
      id = value.id,
    });
    print(id);
    String body = '{"idUser":"$id","idProduct":"$productid"}';
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'auth': '$tt',
        },
        body: body);
    int statusCode = response.statusCode;
    bool isFavoris = false;
    if (statusCode == 200) {
      isFavoris = true;
    }

    return isFavoris;
  }

  Future<bool> addProductFavorite(int productid) async {
    String tt;
    int id;
    String url = AppConfig.URL_IS_PRODUCT_ADD_FAVORIS;
    await session.getToken().then((value) async {
      // Run extra code here
      tt = value;
    }, onError: (error) {
      print(error);
    });
    await getCurrentUser().then((value) => {
          id = value.id,
        });
    print(id);
    String body = '{"id":"$id","idProduct":"$productid"}';
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'auth': '$tt',
        },
        body: body);
    int statusCode = response.statusCode;
    bool added = false;
    if (statusCode == 200) {
      added = true;
      setState(() {
        icon = FontAwesomeIcons.solidHeart;
        isFavorit = true;
        print("added");
      });
    }

    return added;
  }

  Future<bool> removeProductFavorite(int productid) async {
    String tt;
    int id;
    String url = AppConfig.URL_IS_PRODUCT_REMOVE_FAVORIS;
    await session.getToken().then((value) async {
      // Run extra code here
      tt = value;
    }, onError: (error) {
      print(error);
    });
    await getCurrentUser().then((value) => {
          id = value.id,
        });
    print(id);
    String body = '{"id":"$id","idProduct":"$productid"}';
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'auth': '$tt',
        },
        body: body);
    int statusCode = response.statusCode;
    bool rem = false;

    if (statusCode == 200) {
      rem = true;
      setState(() {
        icon = FontAwesomeIcons.heart;
        isFavorit = false;
        print("removed");
      });
    }

    return rem;
  }

  buildCompatibleField() {
    return FutureBuilder(
        future: isProductCompatible(widget.id),
        builder: (context, projectSnap) {
          if (projectSnap.hasData) {
            isFavorit = projectSnap.data;
            if (!isFavorit) {
              return Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.redColor,
                        borderRadius:
                        BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0,top: 5,bottom: 5),
                            child: GestureDetector(
                                onTap: () => {},
                                child: FaIcon(
                                  FontAwesomeIcons.exclamationTriangle,
                                  color: AppTheme.whiteColor,
                                  size: 18,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 3.0, right: 8.0),
                            child: Text(
                              "Ce produit n'est past compatible avec vous.",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.0,
                                  color: AppTheme.whiteColor),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              );
            }else{

            }
            return Container();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  buildDrawerButton(Product product) {

    return FutureBuilder(
        future: isProductFavorite(widget.id),
        builder: (context, projectSnap) {
          if (projectSnap.hasData) {
            isFavorit = projectSnap.data;
            if (isFavorit) {
              icon = FontAwesomeIcons.solidHeart;
            }
            return Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () async {
                      print('clicked');
                      if (isFavorit) {
                        await removeProductFavorite(widget.id);
                      } else {
                        await addProductFavorite(widget.id);
                      }
                    },
                    height: 50.0,
                    minWidth: 50.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: FaIcon(
                      icon,
                      color: AppTheme.primaryColor,
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
