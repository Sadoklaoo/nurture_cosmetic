import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/TextFieldWidget.dart';

import '../Widgets/TextFieldWidget.dart';
import '../Widgets/TextFieldWidget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                            Text(
                              'Se connecter',
                              style: kTitleStyle,
                            ),
                          ],
                        ),
                        VerticalDivider(
                          thickness: 2,
                        ),
                        GestureDetector(
                          onTap: () => AppNavigation.goToSignUp(context),
                          child: Text(
                            'S\'inscrire',
                            style: kTextStyle,
                          ),
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
                          Text(
                            "Pseudo/email",
                            style: kLabelStyle,
                          ),
                          _buildEmail(),
                          SizedBox(
                            height: height * 2 / 100,
                          ),
                          Text(
                            "Mot de passe",
                            style: kLabelStyle,
                          ),
                          _buildPassword(),
                          _buildLoginBtn(),
                          _buildForgotPasswordBtn()
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
    );
  }

  Widget _buildEmail() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        decoration: kBoxDecorationStyle,
        child: TextField(
          cursorColor: AppTheme.primaryColor,
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

  Widget _buildPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        decoration: kBoxDecorationStyle,
        child: TextField(
          cursorColor: AppTheme.primaryColor,
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

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => AppNavigation.goToHome(context),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: AppTheme.primaryAccentColor,
        child: Text(
          'Se Connecter',
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

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Mot de passe oubliée ?',
          style: kTitleStyle,
        ),
      ),
    );
  }
}
