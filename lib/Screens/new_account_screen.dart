import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Widgets/TextFieldWidget.dart';
import 'package:smart_select/smart_select.dart';
import '../Utils/AppTheme.dart';
import '../Widgets/TextFieldWidget.dart';
import 'package:intl/date_symbol_data_local.dart';

class NewAccountScreen extends StatefulWidget {
  @override
  _NewAccountScreenState createState() => _NewAccountScreenState();


}

class _NewAccountScreenState extends State<NewAccountScreen> {
  List<S2Choice<String>> gender = [
    S2Choice<String>(value: 'male', title: 'Homme'),
    S2Choice<String>(value: 'female', title: 'Femme'),
  ];

  String _gender = '';
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
              colorScheme: ColorScheme.light(primary: AppTheme.primaryAccentColor),
              buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.primary
              ),
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
                      _buildEditTextDate(),
                      SizedBox(
                        height: height * 2 / 100,
                      ),
                      // Smart Select Gender
                      SmartSelect<String>.single(
                        title: 'Genre*',
                        modalHeaderStyle: S2ModalHeaderStyle(
                          textStyle: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        placeholder: 'Choisir',
                        choiceStyle: S2ChoiceStyle(
                          titleStyle: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,

                          ),
                          activeColor: AppTheme.primaryAccentColor,
                          highlightColor: AppTheme.primaryAccentColor

                        ),
                        modalStyle: S2ModalStyle(
                          elevation: 10,

                        ),
                        choiceItems: gender,
                        onChange: (selected) =>
                            setState(() => _gender = selected.value),
                        modalType: S2ModalType.popupDialog,
                        tileBuilder: (context, state) {
                          return S2Tile.fromState(
                            state,
                          );
                        },
                        value: '',
                      ),

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

  Widget _buildEditTextDate() {
    return GestureDetector(
      onTap: ()=>_selectDate(context),
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
              hintStyle:  TextStyle(
                  color: AppTheme.greyColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal
              ),
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
        onPressed: () => AppNavigation.goToNumber(context),
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
