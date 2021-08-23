import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nurture_cosmetic/Models/Session.dart';
import 'package:nurture_cosmetic/Models/User.dart';
import 'package:nurture_cosmetic/Utils/AppApi.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/Drawer.dart';
import 'package:nurture_cosmetic/Widgets/TextFieldWidget.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:http/http.dart' as http;

import 'PopUp/PopUp.dart';
class EditPasswordScreen extends StatefulWidget {
  @override
  _EditPasswordScreenState createState() {
    return _EditPasswordScreenState();
  }
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();


  User _currentUser;
  Session session;
  Connectivity connectivity;

  final oldController = TextEditingController();
  final newController = TextEditingController();
  final newConfirmController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    session = new Session();
    connectivity = new Connectivity();
    _currentUser = new User();
    setState(() {
      getCurrentUser().then((value) {
        _currentUser = value;
      });
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
        menu: buildMenu(context),
        type: SideMenuType.slideNRotate,
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 40.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
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
                          child: Text("Mot de passe",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                  color: AppTheme.primaryColor)),
                        ),
                      ),
                      buildDrawerButton(),
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: height * 2 / 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Center(
                      child: Text(
                          "Modifier votre mot de passe."),
                    ),
                  ),
                  SizedBox(
                    height: height * 2 / 100,
                  ),
                  Divider(),
                  Text(
                    "Ancien mot de passe*",
                    style: kHintTextStyle,
                  ),
                  _buildEditText(oldController),
                  SizedBox(
                    height: height * 2 / 100,
                  ),
                  Text(
                    "Nouveau mot de passe*",
                    style: kHintTextStyle,
                  ),
                  _buildEditText(newController),
                  SizedBox(
                    height: height * 2 / 100,
                  ),
                  Text(
                    "Confirmer nouveau mot de passe*",
                    style: kHintTextStyle,
                  ),
                  _buildEditText(newConfirmController),
                  SizedBox(
                    height: height * 2 / 100,
                  ),

                  _buildSignUpBtn()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildDrawerButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        MaterialButton(
          onPressed: () {
            final _state = _sideMenuKey.currentState;
            if (_state.isOpened)
              _state.closeSideMenu();
            else
              _state.openSideMenu();
          },
          height: 50.0,
          minWidth: 50.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Image.asset(
            AppStrings.home_icon,
            width: 50,
            height: 50,
          ),
        )
      ],
    );
  }

  Widget _buildEditText(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        decoration: kBoxDecorationStyle,
        child: TextField(
          controller: controller,
          obscureText: true,
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
        onPressed: () async {
          if (oldController.text.isEmpty ||
              newController.text.isEmpty ||
              newConfirmController.text.isEmpty ) {
            final action = await Dialogs.yesAbortDialog(context, 'Fields Error',
                'Complete all fields', DialogType.error);
          } else if (newController.text.trim()!=newConfirmController.text.trim()) {
            final action = await Dialogs.yesAbortDialog(
                context, 'Password Error', 'Passwords doesnt match.', DialogType.error);
          } else {
            connectivity.checkConnectivity().then((onValue) async {
              if (onValue == ConnectivityResult.wifi ||
                  onValue == ConnectivityResult.mobile) {
                updateUser(
                  oldController.text.trim(),
                  newController.text.trim()
                );
              } else {
                final action = await Dialogs.yesAbortDialog(context, 'Connection Error',
                    'Connection Unavailable', DialogType.error);
              }
            });
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: AppTheme.primaryAccentColor,
        child: Text(
          'MODIFIER',
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

  void updateUser(var old, var newPassword) async {
    String tt;
    String url = AppConfig.URL_EDIT_CLIENT_PASSWORD;
    await session.getToken().then((value) async {
      // Run extra code here
      tt = value;
    }, onError: (error) {
      print(error);
    });
    String email = _currentUser.email;
    String json =
        '{"password": "$old" , "newpassword": "$newPassword" , "email": "$email"}';
    final response = await http.put(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'auth': '$tt',
        },
        body: json);
    int statusCode = response.statusCode;
    if (statusCode == 402) {
      final action = await Dialogs.yesAbortDialog(
          context, 'Data Error', 'Wrong Data Format', DialogType.error);
    } else if (statusCode == 400) {
      final action = await Dialogs.yesAbortDialog(context, 'Server Error',
          'Error updating data in server.', DialogType.error);
    } else if (statusCode == 403) {
      final action = await Dialogs.yesAbortDialog(context, 'Password Error',
          'Old password incorrect.', DialogType.error);
    } else if (statusCode == 404) {
      final action = await Dialogs.yesAbortDialog(
          context, 'Login Error', 'Connect Again', DialogType.error);
    } else if (statusCode == 204) {
      final action = await Dialogs.yesAbortDialog(context, 'Success',
          'Profile Successfully Edited', DialogType.success);
      Navigator.pop(context);
    }
  }

}
