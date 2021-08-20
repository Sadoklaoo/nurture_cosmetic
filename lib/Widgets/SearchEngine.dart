import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:nurture_cosmetic/Models/Cat.dart';
import 'package:nurture_cosmetic/Models/Product.dart';
import 'package:nurture_cosmetic/Models/ProductType.dart';
import 'package:nurture_cosmetic/Screens/details_screen.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/FilterEngine.dart';

import 'ProductListItem.dart';

class DataSeach extends SearchDelegate<String> {
  Cat categorie;
  ProductType type;
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
    // show results
    return Center(
      child: Container(
        height: 100,
        width: 100,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show sugguestions
    if (this.categorie != null) {
      // print(categorie);
    }

    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((element) => element.startsWith(query)).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSugguestions(),
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
                  onTap: () {
                    Navigator.of(context).push(
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
              future: this.products,
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
                            Navigator.of(context).push(MaterialPageRoute(
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
                  return Center(child: CircularProgressIndicator());
                }
              }),
        )),
      ],
    );
  }
}
