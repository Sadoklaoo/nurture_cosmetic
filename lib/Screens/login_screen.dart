import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:nurture_cosmetic/Models/Session.dart';
import 'package:nurture_cosmetic/Models/User.dart';
import 'package:nurture_cosmetic/Utils/AppApi.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/TextFieldWidget.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/TextFieldWidget.dart';
import 'PopUp/PopUp.dart';
import 'home_screen.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  Session session;
  bool isLoggedIn;

  bool isLoggedInF = false;
  var profileData;
  String tokenNotification;
 // var facebookLogin = FacebookLogin();
  Connectivity connectivity;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    session = new Session();


    connectivity = new Connectivity();
    session.isLoggedIn().then((value) {
      // Run extra code here
      if (value) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    }, onError: (error) {
      print(error);
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
      home: Scaffold(
        body: Container(
          height: height,
          width: width,

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
      ),
    );
  }

  Widget _buildEmail() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        decoration: kBoxDecorationStyle,
        child: TextFormField(
          controller: numberController,
          // ignore: missing_return
          validator: (String value) {
            if (value.trim().isEmpty) {
              print('Phone Number is required');
            }
          },
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
        child: TextFormField(
          controller: passwordController,
          obscureText: true,
          // ignore: missing_return
          validator: (String value) {
            if (value.trim().isEmpty) {
              print('Password is required');
            }
          },
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
        onPressed: () async {
          if (numberController.text.isEmpty ||
              passwordController.text.isEmpty) {
            final action = await Dialogs.yesAbortDialog(
                context,
                'Fields Error',
                'Complete all fields',
                DialogType.error);
          } else {
            connectivity
                .checkConnectivity()
                .then((onValue) {
              if (onValue == ConnectivityResult.wifi ||
                  onValue == ConnectivityResult.mobile) {
                setState(() {
                  _Login(numberController.text.trim(),
                      passwordController.text.trim());
                  print(numberController.text.trim());
                  print(passwordController.text.trim());
                  print("Conx valid");
                });
              } else {
                setState(() {
                  print("no cnx ");
                });
              }
            });
          }
        } ,
        //=> AppNavigation.goToHome(context),
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

  void _Login(var email, var password) async {
    String url = AppConfig.URL_LOGIN;
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"email": "$email" , "password": "$password", "typeAccount": "CLIENT"}';
    // make POST request
    var response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;

    // this API passes back the id of the new item added to the body
    //print(token);
    print(statusCode);

    if (statusCode == 402) {
      final action = await Dialogs.yesAbortDialog(
          context, 'Email', 'Wrong PhoneNumber', DialogType.error);
    } else if (statusCode == 403) {
      final action = await Dialogs.yesAbortDialog(
          context, 'Password', 'Wrong Password', DialogType.error);
    } else if (statusCode == 404) {
      final action = await Dialogs.yesAbortDialog(
          context, 'Login Error', 'Wrong Credentials', DialogType.error);
    } else {
      Map<String, dynamic> data = jsonDecode(response.body);
      var token = data['token'];
      session.setToken(token);
      //print(session.getToken())
     // print(data["token"]);
    // await getCurrentUser();
      session.setLoggedIn();
      //SharedPreferences prefs = await SharedPreferences.getInstance();
      //print(prefs.getString('token'));
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()
        // MyApp(),
      ));
    }
  }




  void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
      this.profileData = profileData;
    });
  }
  _logout() async {
   // await facebookLogin.logOut();
    onLoginStatusChanged(false);
    print("Logged out");
  }

  /*void initiateFacebookLogin() async {
    var facebookLoginResult =
    await facebookLogin.logInWithReadPermissions(['email']);

    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        var graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.width(400)&access_token=${facebookLoginResult.accessToken.token}');

        var profile = json.decode(graphResponse.body);
        print(profile.toString());

        onLoginStatusChanged(true, profileData: profile);
        break;
    }
  }
*/
}
