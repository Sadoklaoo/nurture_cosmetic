import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:nurture_cosmetic/Models/Cat.dart';
import 'package:nurture_cosmetic/Models/FilterSettings.dart';
import 'package:nurture_cosmetic/Models/Product.dart';
import 'package:nurture_cosmetic/Models/ProductType.dart';
import 'package:nurture_cosmetic/Models/Session.dart';
import 'package:nurture_cosmetic/Screens/details_screen.dart';
import 'package:nurture_cosmetic/Utils/AppApi.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Utils/AppUtils.dart';
import 'package:nurture_cosmetic/Widgets/FilterEngine.dart';
import 'package:http/http.dart' as http;
import 'ProductListItem.dart';

class DataSeach extends SearchDelegate<String> {
  Cat categorie;
  ProductType type;
  Session session;
  List<Product> _products;
  Future<List<Product>> products;
  DataSeach(this.products, this.categorie, this.type);
  final cities = [
    "Nabeul",
    "Tunis",
    "Hammemt",
    "Ariana",
    "Sousse",
  ];

  final recentCities = [
    "Nabeul",
    "Tunis",
    "Hammemt",
  ];


  @override
  List<Widget> buildActions(BuildContext context) {
    // action for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  Widget _buildSugguestions() {
    return DefaultTabController(
        length: 2, // length of tabs
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
                    Tab(text: 'Récommandé'),
                    Tab(text: 'Nouveau'),
                  ],
                ),
              ),
              Container(
                  height: 150,
                  color: AppTheme.whiteColor,//height of TabBarView

                  child: TabBarView(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppTheme.primaryAccentColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: [
                              Image.asset("assets/images/product_icon.png",
                                  width: 140, height: 140),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Text('SHALIMAR',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: AppTheme.whiteColor)),
                                  ),
                                  Text('18/20',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: AppTheme.whiteColor)),
                                  Text('120 TND',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: AppTheme.whiteColor)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppTheme.primaryColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, right: 8.0),
                                            child: Text(
                                              "Bio",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 16.0,
                                                  color: AppTheme.whiteColor),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppTheme.primaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: [
                              Image.asset("assets/images/product_icon.png",
                                  width: 140, height: 140),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Text('SHALIMAR',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: AppTheme.whiteColor)),
                                  ),
                                  Text('18/20',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: AppTheme.whiteColor)),
                                  Text('120 TND',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: AppTheme.whiteColor)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppTheme.primaryColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, right: 8.0),
                                            child: Text(
                                              "Bio",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 16.0,
                                                  color: AppTheme.whiteColor),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]))
            ]));
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon for the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    query;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Résultats",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: AppTheme.primaryColor),
              ),
              GestureDetector(
                  onTap: () async {
                   Filter res = await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FilterEngine()
                          // MyApp(),
                        ));
                  },
                  child: Icon(
                    Icons.filter_list_outlined,
                    color: AppTheme.primaryColor,
                  ))
            ],
          ),
        ),
        Expanded(
            child: LiquidPullToRefresh(
              showChildOpacityTransition: true,
              color: AppTheme.primaryAccentColor,

              // ignore: missing_return
              onRefresh: () {},
              child: FutureBuilder(
                  future: getProductByKey(query),
                  builder: (context, projectSnap) {
                    if (projectSnap.hasData) {
                      print(projectSnap.data.length);
                      return ListView.builder(
                        padding: EdgeInsets.only(right: 6, left: 6),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: projectSnap.data.length,
                        itemBuilder: (context, index) {
                          Product product = projectSnap.data[index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                      id: product.id,
                                    )
                                ));
                              },
                              // onTap: () => AppNavigation.goToDetails(context,product.id),
                              child: ProductListItem(product));
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            )),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show sugguestions
    if (this.categorie != null) {
      // print(categorie);
    }
    if (this.products != null) {
      print(products.whenComplete(() => print("Z")));
    }

    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((element) => element.startsWith(query)).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //_buildSugguestions(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Résultats",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: AppTheme.primaryColor),
              ),
              GestureDetector(
                  onTap: () async {
                    Filter res = await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FilterEngine()
                            // MyApp(),
                            ));
                    if (res!=null){
                      this.products = filterAllProduct(res);
                    }

                  },
                  child: Icon(
                    Icons.filter_list_outlined,
                    color: AppTheme.primaryColor,
                  ))
            ],
          ),
        ),
        Expanded(
            child: LiquidPullToRefresh(
          showChildOpacityTransition: true,
          color: AppTheme.primaryAccentColor,

          // ignore: missing_return
          onRefresh: () {},
          child: FutureBuilder(
              future: this.products,
              builder: (context, projectSnap) {
                if (projectSnap.hasData) {
                  print(projectSnap.data.length);
                  return ListView.builder(
                    padding: EdgeInsets.only(right: 6, left: 6),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: projectSnap.data.length,
                    itemBuilder: (context, index) {
                      Product product = projectSnap.data[index];
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                      id: product.id,
                                    )
                                ));
                          },
                          // onTap: () => AppNavigation.goToDetails(context,product.id),
                          child: ProductListItem(product));
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        )),
      ],
    );
  }
  Future<List<Product>> getProductByKey(String key) async {
    String tt;
    String url = AppConfig.URL_SEARCH_PRODUCTS;
    session = new Session();
    await session.getToken().then((value) async {
      // Run extra code here
      tt = value;
    }, onError: (error) {
      print(error);
    });

    print(key);
    String body = '{"key":"$key"}';
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

  Future<List<Product>> filterAllProduct(Filter key) async {
    String tt;
    String url = AppConfig.URL_FILTER_PRODUCTS;
    session = new Session();
    await session.getToken().then((value) async {
      // Run extra code here
      tt = value;
    }, onError: (error) {
      print(error);
    });


    String body = jsonEncode(key.toMap()) ;
    print(body);
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
