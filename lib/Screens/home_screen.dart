import 'dart:async';

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
                  RecommendedApps()
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

  Widget RecommendedApps() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: labelContainer('Recommended for you'),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: appsContainer(),
        ),
      ],
    );
  }

  Widget appsContainer() {
    return Container(
        height: 160.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            imageSection(
                'https://lh3.googleusercontent.com/ZZPdzvlpK9r_Df9C3M7j1rNRi7hhHRvPhlklJ3lfi5jk86Jd1s0Y5wcQ1QgbVaAP5Q=s180-rw',
                'Faceebook','4.1'),
            SizedBox(
              width: 20.0,
            ),
            imageSection(
                'https://lh3.googleusercontent.com/00APBMVQh3yraN704gKCeM63KzeQ-zHUi5wK6E9TjRQ26McyqYBt-zy__4i8GXDAfeys=s180-rw',
                'Linkedin','4.6'),
            SizedBox(
              width: 20.0,
            ),
            imageSection(
                'https://lh3.googleusercontent.com/jcbqFma-5e91cY9MlEasA-fvCRJK493MxphrqbBd8oS74FtYg00IXeOAn0ahsLprxIA=s180-rw',
                'Netflix','4.8'),
            SizedBox(
              width: 20.0,
            ),
            imageSection(
                'https://lh3.googleusercontent.com/F5B6GGdo6tAVNApr2X2p35igQhYBouuPA3uuIu3LEPHsIl7JPMHA1sn4-5J2B78JWA=s180-rw',
                'Flutter','5.0'),
            SizedBox(
              width: 20.0,
            ),
            imageSection(
                'https://lh3.googleusercontent.com/uOjFCUkQ4w56akZTg_AAGYsyiFd1UB3-Rd8KYDoiIpD05VzkTz647PO3B_2v9sPg2BM=s180-rw',
                'Pinterest','4.9'),
            SizedBox(
              width: 20.0,
            ),
            imageSection(
                'https://lh3.googleusercontent.com/aYbdIM1abwyVSUZLDKoE0CDZGRhlkpsaPOg9tNnBktUQYsXflwknnOn2Ge1Yr7rImGk=s180-rw',
                'Instagram','4.8'),
          ],
        ));
  }

  Widget imageSection(String imageVal, String appVal,String rateVal) {
    return Column(
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: new NetworkImage(imageVal),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),

      ],
    );
  }
  Widget labelContainer(String labelVal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          labelVal,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: AppTheme.primaryColor),
        ),

      ],
    );
  }



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
