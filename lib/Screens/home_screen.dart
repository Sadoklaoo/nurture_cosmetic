import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nurture_cosmetic/Models/Category.dart' ;
import 'package:nurture_cosmetic/Models/Session.dart';
import 'package:nurture_cosmetic/Models/ProductType.dart';
import 'package:nurture_cosmetic/Models/User.dart';
import 'package:nurture_cosmetic/Models/Product.dart' ;
import 'package:nurture_cosmetic/Utils/AppApi.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Utils/AppUtils.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:nurture_cosmetic/Widgets/Drawer.dart';
import 'package:nurture_cosmetic/Widgets/SearchEngine.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  User _currentUser;
  Session session;
  Connectivity connectivity;
  Future<List<Categorie>> categories;
  List<Categorie> _categories;
  List<ProductType> _productType;
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
      getCategories();
    });
    setState(() {
      //
    });
  }



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: ThemeData(
          primaryColor: AppTheme.primaryColor,
          accentColor: AppTheme.primaryAccentColor,
          fontFamily: 'Nunito'),
      debugShowCheckedModeBanner: false,
      home: SideMenu(
        background: AppTheme.primaryColor,
        key: _sideMenuKey,
        menu: buildMenu(context, getCurrentUser()),
        type: SideMenuType.slideNRotate,
        child: Scaffold(
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
                      SizedBox(
                        height: 20,
                      ),
                      categorySelector(),
                      SizedBox(
                        height: 20,
                      ),
                      productTypeSelector(),
                      /* natureSelector()*/
                    ],
                  ),
                ),
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
              FutureBuilder(
                  future: getCurrentUser(),
                  builder: (context, projectSnap) {
                    if(projectSnap.hasData ){
                      return Text(
                        'Bonjour, ' + projectSnap.data.firstName,
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    }
                    else  {
                      //print('project snapshot data is: ${projectSnap.data}');
                      return CircularProgressIndicator();
                    }

                  }),
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
          GestureDetector(
            onTap: () {
              final _state = _sideMenuKey.currentState;
              if (_state.isOpened)
                _state.closeSideMenu();
              else
                _state.openSideMenu();
            },
            child: Image.asset(
              AppStrings.home_icon,
              width: 60,
              height: 60,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: GestureDetector(
          onTap: () {
            showSearch(context: context, delegate: DataSeach(null,null,null));
          },
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
              enabled: false,
              cursorColor: AppTheme.greyColor,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.only(top: 13), // add padding to adjust text
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



  //Produit
  Widget productTypeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 8.0),
          child: labelContainer('Nature',
              "Selectionner une nature pour visualiser ses produits."),
        ),
        productTypeList(),
      ],
    );
  }

  Widget productTypeList() {
    return Container(
      height: 110.0,
      child: FutureBuilder(
          future: getProductTypes(),
          builder: (context, projectSnap) {
            if(projectSnap.hasData ){
              return ListView.builder(
                itemCount: projectSnap.data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  ProductType productType = projectSnap.data[index];
                  return Row(
                    children: <Widget>[

                      GestureDetector(
                        onTap: () => {
                          showSearch(context: context, delegate: DataSeach(null,null,productType))
                        },
                        child: imageSection(productType.image, productType.TypeName,
                            AppTheme.primaryColor),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                    ],
                  );
                },
              );
            }
            else  {
              //print('project snapshot data is: ${projectSnap.data}');
              return CircularProgressIndicator();
            }

          }),
    );
  }

  //Category
  Widget categorySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 8.0),
          child: labelContainer('Category',
              "Selectionner une categorie pour visualiser ses produits."),
        ),
        categoryList(),
      ],
    );
  }

  Widget categoryList() {
    return Container(
      height: 110.0,
      child: FutureBuilder(
          future: getCategories(),
          builder: (context, projectSnap) {
            if(projectSnap.hasData ){
              return ListView.builder(
                itemCount: projectSnap.data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Categorie categorie = projectSnap.data[index];
                  return Row(
                    children: <Widget>[

                      GestureDetector(
                        onTap: () async => {
                          this._futureProducts = (Future(() async => (await this.getProductByCategory(categorie)) )) ,
                        showSearch(context: context, delegate: DataSeach(this._futureProducts,categorie,null))
                        },
                        child: imageSection(categorie.image, categorie.categoryName,
                            AppTheme.primaryAccentColor),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                    ],
                  );
                },
              );
            }
            else  {

              return CircularProgressIndicator();
            }

          }),
    );

  }

  //Design
  Widget imageSection(String imageVal, String title, Color color) {
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
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              height: 60.0,
              width: 60.0,
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    AppConfig.URL_GET_IMAGE+imageVal,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: AutoSizeText(
                title,
                softWrap: true,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: AppTheme.whiteColor),
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

  Widget labelContainer(String labelVal, String subLabelVal) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          labelVal,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: AppTheme.primaryColor),
        ),
        Text(
          subLabelVal,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12.0,
              color: AppTheme.greyColor),
        ),
      ],
    );
  }
  //End Design
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


  Future getCategories() async {
    String tt;
    String url = AppConfig.URL_GET_CATEGORY;
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

    List<dynamic>data = jsonDecode(response.body);
    _categories = data.map((json) => Categorie.fromMap(json)).toList();
    return  (Future(() => _categories));
  }

  Future getProductTypes() async {
    String tt;
    String url = AppConfig.URL_GET_ALL_PRODUCT_TYPE;
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
    List<dynamic>data = jsonDecode(response.body);
    _productType = data.map((json) => ProductType.fromMap(json)).toList();
    return  (Future(() => _productType));
  }

  Future<List<Product>> getProductByCategory(Categorie categorie) async {
    String tt;
    String url = AppConfig.URL_GET_ALL_PRODUCT_BY_CATEGORY;
    await session.getToken().then((value) async {
      // Run extra code here
      tt = value;
    }, onError: (error) {
      print(error);
    });
    int id = categorie.id;
    String body = '{"id":"$id"}';
    final response = await http.post(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'auth': '$tt',
    },
    body: body);
    int statusCode = response.statusCode;
    List<dynamic>data = jsonDecode(response.body);
    _products = data.map((json) => Product.fromMap(json)).toList();

    return  (Future(() => _products));
  }
}
