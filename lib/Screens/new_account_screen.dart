import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/TextFieldWidget.dart';

import '../Utils/AppTheme.dart';
import '../Widgets/TextFieldWidget.dart';

class NewAccountScreen extends StatefulWidget {
  @override
  _NewAccountScreenState createState() => _NewAccountScreenState();
}

class _NewAccountScreenState extends State<NewAccountScreen> {
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
      body: Container(
        height: height,
        width: width ,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 40.0,
          ),
          child: Container(
            width: width - (width * 10 / 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    GestureDetector(
                        onTap: () => AppNavigation.goToSignUp(context),
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: AppTheme.primaryAccentColor,
                        )),
                    SizedBox(
                      width: width * 35 / 100,
                    ),
                    Image.asset(
                      AppStrings.logo_icon,
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 2 / 100,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Créer ',
                      style: TextStyle(
                        color: AppTheme.primaryAccentColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      )),
                  TextSpan(
                      text: 'Compte',
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      )),
                ])),
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
                      Text(
                        "Nom*",
                        style: kHintTextStyle,
                      ),
                      _buildEditText(),
                      SizedBox(
                        height: height * 2 / 100,
                      ),
                      Text(
                        "Prénom*",
                        style: kHintTextStyle,
                      ),
                      _buildEditText(),
                      SizedBox(
                        height: height * 2 / 100,
                      ),
                      Text(
                        "Adresse e-mail*",
                        style: kHintTextStyle,
                      ),
                      _buildEditText(),
                      SizedBox(
                        height: height * 2 / 100,
                      ),
                      Text(
                        "Date de naissance*",
                        style: kHintTextStyle,
                      ),
                      _buildEditText(),
                      SizedBox(
                        height: height * 2 / 100,
                      ),
                      Text(
                        "Genre*",
                        style: kHintTextStyle,
                      ),
                      _buildEditText(),
                      SizedBox(
                        height: height * 2 / 100,
                      ),
                      Text(
                        "Mot de passe*",
                        style: kHintTextStyle,
                      ),
                      _buildEditText(),
                      SizedBox(
                        height: height * 2 / 100,
                      ),
                      Text(
                        "Confirmer mot de passe*",
                        style: kHintTextStyle,
                      ),
                      _buildEditText(),
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
                        height: height * 2 / 100,
                      ),
                      _buildSignUpBtn()
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

  Widget _buildEditText() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        decoration: kBoxDecorationStyle,
        child: TextField(
          cursorColor: AppTheme.primaryAccentColor,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.primaryAccentColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.greyWhiteColor),
            ),
          ),
          style: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _buildSignUpBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => AppNavigation.goToIntro(context),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: AppTheme.primaryAccentColor,
        child: Text(
          'S\'inscrire',
          style: TextStyle(
            color: AppTheme.whiteColor,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
