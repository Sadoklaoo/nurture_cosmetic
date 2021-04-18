import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/TextFieldWidget.dart';

import '../Widgets/TextFieldWidget.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
      home: Scaffold(
        body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: height * 10 / 100,
                ),
                Image.asset(
                  AppStrings.app_icon,
                  width: 250,
                  height: 250,
                ),
                SizedBox(
                  height: height * 10 / 100,
                ),
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: AppTheme.whiteColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        height: height * 2 / 100,
                      ),
                      IntrinsicHeight(
                          child: new Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () => AppNavigation.goToLogin(context),
                                child: Text(
                                  'Se connecter',
                                  style: kTextStyle,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            thickness: 2,
                          ),
                          Text(
                            'S\'inscrire',
                            style: kTitleStyle,
                          ),
                        ],
                      )),
                      SizedBox(
                        height: height * 2 / 100,
                      ),
                      Container(
                        width: width - (width * 10 / 100),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            _buildBtn(
                                () => print('S\'inscrire avec Facebook'),
                                FontAwesomeIcons.facebookF,
                                AppTheme.facebookColor,
                                'S\'inscrire avec Facebook'),
                            Center(
                              child: Text(
                                '- OU -',
                                style: TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            _buildBtn(
                                () =>  AppNavigation.goToNewAccount(context),
                                FontAwesomeIcons.solidEnvelope,
                                AppTheme.primaryAccentColor,
                                'S\'inscrire avec Email'),
                            SizedBox(
                              height: height * 2 / 100,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      'En appuyant sur s\'inscrire, vous reconnaissez que vous avez accepté ',
                                  style: TextStyle(
                                    color: AppTheme.primaryColor,
                                    fontWeight: FontWeight.normal,
                                  )),
                              TextSpan(
                                  text: 'les conditions générales ',
                                  style: TextStyle(
                                    color: AppTheme.greenColor,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: 'et lu ',
                                  style: TextStyle(
                                    color: AppTheme.primaryColor,
                                    fontWeight: FontWeight.normal,
                                  )),
                              TextSpan(
                                  text: 'la politique de confidentialité.',
                                  style: TextStyle(
                                    color: AppTheme.greenColor,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ])),
                            SizedBox(
                              height: height * 5 / 100,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBtn(Function onTap, IconData logo, Color color, String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      width: double.infinity,
      // ignore: deprecated_member_use
      child: RaisedButton(
        elevation: 5.0,
        onPressed: onTap,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              logo,
              color: AppTheme.whiteColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: AppTheme.whiteColor,
                letterSpacing: 1.5,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
