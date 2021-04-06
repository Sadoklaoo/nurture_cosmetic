import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Utils/hometoptabs.dart';
import 'package:nurture_cosmetic/Widgets/TextFieldWidget.dart';

import '../Widgets/TextFieldWidget.dart';
import '../Widgets/TextFieldWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          color: AppTheme.whiteColor,
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildHomeHeader(),
                  _buildSearchBar(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildSugguestions(),
                  categorySelector(),
                  productTypeSelector(),
                  natureSelector()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHomeHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bonjour, Foulen',
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Bienvenue à Nurture Cosmetic.',
                style: TextStyle(
                  color: AppTheme.greyColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Image.asset(
            AppStrings.home_icon,
            width: 60,
            height: 60,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.searchBgColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            onTap: () {
              showSearch(context: context, delegate: DataSeach());
            },
            cursorColor: AppTheme.greyColor,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(top: 20), // add padding to adjust text
              isDense: true,
              hintText: "Search",
              hintStyle: TextStyle(
                color: AppTheme.greyColor,
              ),
              prefixIcon: Icon(
                Icons.search,
                size: 25,
                color: AppTheme.greyColor,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.greyColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.searchBgColor),
              ),
            ),
          ),
        ));
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
                  unselectedLabelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  labelColor: AppTheme.primaryColor,
                  unselectedLabelColor: AppTheme.greyColor,
                  indicatorColor: Colors.transparent,
                  labelPadding: EdgeInsets.only(left:15),
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

  //Nature
  Widget natureSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Padding(
          padding: EdgeInsets.only(top:10.0,bottom: 8.0),
          child: labelContainer('Nature',"Selectionner une nature pour visualiser ses produits."),
        ),
        natureList(),
      ],
    );
  }
  Widget natureList() {
    return Container(
        height: 110.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            imageSection(
                AppStrings.skin_icon,"Soins de la peau",AppTheme.primaryAccentColor),
            SizedBox(
              width: 8.0,
            ),
            imageSection(
                AppStrings.face_icon,"Soins de visage",AppTheme.primaryAccentColor),
            SizedBox(
              width: 8.0,
            ),
            imageSection(
                AppStrings.hair_icon,"Soins de cheveaux",AppTheme.primaryAccentColor),
            SizedBox(
              width: 8.0,
            ),
            imageSection(
                AppStrings.pers_icon,"Soins personelles",AppTheme.primaryAccentColor),

          ],
        ));
  }
  //Produit
  Widget productTypeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Padding(
          padding: EdgeInsets.only(top:10.0,bottom: 8.0),
          child: labelContainer('Type de produit',"Selectionner un type pour visualiser ses produits."),
        ),
        productTypeList(),
      ],
    );
  }
  Widget productTypeList() {
    return Container(
        height: 110.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            imageSection(
                AppStrings.skin_icon,"Soins de la peau",AppTheme.primaryColor),
            SizedBox(
              width: 8.0,
            ),
            imageSection(
                AppStrings.face_icon,"Soins de visage",AppTheme.primaryColor),
            SizedBox(
              width: 8.0,
            ),
            imageSection(
                AppStrings.hair_icon,"Soins de cheveaux",AppTheme.primaryColor),
            SizedBox(
              width: 8.0,
            ),
            imageSection(
                AppStrings.pers_icon,"Soins personelles",AppTheme.primaryColor),

          ],
        ));
  }
  //Category
  Widget categorySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Padding(
          padding: EdgeInsets.only(top:10.0,bottom: 8.0),
          child: labelContainer('Category',"Selectionner une categorie pour visualiser ses produits."),
        ),
        categoryList(),
      ],
    );
  }
  Widget categoryList() {
    return Container(
        height: 110.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            imageSection(
                AppStrings.skin_icon,"Soins de la peau",AppTheme.primaryAccentColor),
            SizedBox(
              width: 8.0,
            ),
            imageSection(
                AppStrings.face_icon,"Soins de visage",AppTheme.primaryAccentColor),
            SizedBox(
              width: 8.0,
            ),
            imageSection(
                AppStrings.hair_icon,"Soins de cheveaux",AppTheme.primaryAccentColor),
            SizedBox(
              width: 8.0,
            ),
            imageSection(
                AppStrings.pers_icon,"Soins personelles",AppTheme.primaryAccentColor),

          ],
        ));
  }


  //Design
  Widget imageSection(String imageVal,String title, Color color) {
    return Container(
      height: 110.0,
      width: 110.0,

      decoration: new BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),

      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Container(
              height: 60.0,
              width:60.0,
              decoration: new BoxDecoration(

                image: DecorationImage(
                  image: AssetImage(
                      imageVal,
                  ),
                  fit: BoxFit.fitWidth,
                ),

              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top:5.0),
            child: AutoSizeText(
              title,
              softWrap: true,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.0,color: AppTheme.whiteColor),
              maxLines: 2,
            )
            /*Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13.0,color: AppTheme.whiteColor),
            ),*/

          ),

        ],
      ),
    );
  }
  Widget labelContainer(String labelVal,String subLabelVal) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          labelVal,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: AppTheme.primaryColor),
        ),
        Text(
          subLabelVal,
          style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12.0,color: AppTheme.greyColor),
        ),
      ],
    );
  }
 //End Design


}

class DataSeach extends SearchDelegate<String> {
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
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          onTap: () {
            showResults(context);
          },
          leading: Icon(Icons.location_city),
          title: RichText(
              text: TextSpan(
                  text: suggestionList[index].substring(0, query.length),
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                  children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey, fontSize: 15))
              ]))),
      itemCount: suggestionList.length,
    );
  }
}
