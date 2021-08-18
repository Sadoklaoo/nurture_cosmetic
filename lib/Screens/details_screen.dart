import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nurture_cosmetic/Models/Product.dart';
import 'package:nurture_cosmetic/Models/Session.dart';
import 'package:nurture_cosmetic/Models/User.dart';
import 'package:nurture_cosmetic/Utils/AppApi.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/Drawer.dart';
import 'package:nurture_cosmetic/Widgets/NotificationListItem.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailsScreen extends StatefulWidget {
  final int id;
  DetailsScreen({ @required this.id}) ;
  @override
  _DetailsScreenState createState() {
    return _DetailsScreenState();
  }
}

class _DetailsScreenState extends State<DetailsScreen> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  Session session;
  int id;
  Connectivity connectivity;
  Product product;
  User _currentUser;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    session = new Session();
    connectivity = new Connectivity();
    _currentUser = new User();

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

  Future getProductDetail(int id) async {
    String tt;
    String url = AppConfig.URL_GET_ALL_PRODUCT_DETAILS+id.toString();
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
    return (Future(() => product));
    //updateNotification(_currentUser.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SideMenu(
      background: AppTheme.primaryColor,
      key: _sideMenuKey,
      menu: buildMenu(context,getCurrentUser()),
      type: SideMenuType.slideNRotate,
      child: Scaffold(
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
                      padding: const EdgeInsets.only(top: 8.0, left:20),
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
                    buildDrawerButton(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20,right: 20),
                  child: Divider(),
                ),
                SizedBox(
                  height: height * 2 / 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20,right: 20),
                  child: Text(
                    "GUERLAIN SHALIMAR",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: AppTheme.primaryColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20,right: 20),
                  child: Text(
                    "Eau de parfum",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20.0,
                        color: AppTheme.primaryColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0,left:20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppTheme.primaryAccentColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            "138.0 TND",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: AppTheme.whiteColor),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            "100 mL",
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
                                    "14/20",
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

                SizedBox(
                  height: height * 3 / 100,
                ),
                Row(
                  children: [
                    Image.asset("assets/images/prod_image_left.png",width: width*50/100,),
                    SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: AutoSizeText(
                        'Inspiré par l\'histoire d\'un amour fou entre un empereur et une princesse indienne, Shalimar, qui signifie en sanscrit "Temple de l\'amour", symbolise à jamais l\'essence du désir, la promesse d\'un amour éternel.',
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
                Row(
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
                    GestureDetector(onTap: ()=>{
                      AppNavigation.goToIngredients(context)
                    },
                        child: Image.asset("assets/images/left_info_btn.png")),


                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20,right: 20),
                  child: Text(
                    "Shalimar est le premier oriental de l'histoire de la parfumerie.",
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
                  padding: const EdgeInsets.only(left:20,right: 20),
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
                  padding: const EdgeInsets.only(left:20,right: 20),
                  child: _buildSugguestions(),
                )
              ],
            ),
          ),
        ),
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
  buildDrawerButton() {
    return Padding(
      padding: const EdgeInsets.only(right:20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          MaterialButton(
            onPressed: () {},
            height: 50.0,
            minWidth: 50.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: FaIcon(FontAwesomeIcons.heart),
          )
        ],
      ),
    );
  }
}
