import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/Drawer.dart';
import 'package:nurture_cosmetic/Widgets/TextFieldWidget.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() {
    return _EditProfileScreenState();
  }
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

  final dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: AppTheme.primaryColor,
              accentColor: AppTheme.primaryAccentColor,
              colorScheme:
                  ColorScheme.light(primary: AppTheme.primaryAccentColor),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child,
          );
        },
        firstDate: DateTime(1920, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;

        dateController.text = DateFormat.yMMMMd().format(picked);
      });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SideMenu(
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
                        child: Text("Modifier Profile",
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
                        "lorem ipsum is Simply dummy text of the printing and typesetting industry."),
                  ),
                ),
                SizedBox(
                  height: height * 2 / 100,
                ),
                Divider(),
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
                _buildEditTextDate(),
                SizedBox(
                  height: height * 1 / 100,
                ),
                _buildSignUpBtn()
              ],
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

  Widget _buildEditTextDate() {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Container(
          decoration: kBoxDecorationStyle,
          child: TextField(
            controller: dateController,
            keyboardType: TextInputType.datetime,
            enabled: false,
            cursorColor: AppTheme.primaryAccentColor,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 14.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.primaryAccentColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.greyWhiteColor),
              ),
              prefixIcon: Icon(
                Icons.cake,
                color: AppTheme.primaryAccentColor,
              ),
              hintText: 'Entrez votre date de naissance',
              hintStyle: TextStyle(
                  color: AppTheme.greyColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
            style: kHintTextStyle,
          ),
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
        onPressed: () => Navigator.pop(context),
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
}
