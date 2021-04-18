import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';

class AccountNumberScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AccountNumberScreenState();
}

class AccountNumberScreenState extends State<AccountNumberScreen> {
  bool _isButtonDisabled;
  @override
  void initState() {
    _isButtonDisabled = false;
  }
  void _enableButton() {
    setState(() {
      _isButtonDisabled = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: OtpScreen(),
    );
  }
}

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  BuildContext context;
  TextEditingController numberController = TextEditingController();

  var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: Colors.transparent));

  int pinIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    this.context = context;
    return Material(

      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  buildExitButton(),
                  SizedBox(
                    width: width * 12 / 100,
                  ),
                  Text('Confirmation numéro',style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.primaryColor))
                ],
              ),
              Expanded(
                child: Container(
                  alignment: Alignment(0, 0.5),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      buildSecurityText(),
                      SizedBox(
                        height: 40.0,
                      ),
                      InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber value) {},
                        isEnabled: false,
                        textFieldController: numberController,
                        maxLength: 8,
                        hintText: 'Numéro de téléphone',
                        countries: ['TN'],
                        textStyle: TextStyle(
                          color: AppTheme.primaryColor,
                        ),
                        inputDecoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppTheme.primaryAccentColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.greyWhiteColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                    ],
                  ),
                ),
              ),
              buildNumberPad(),
            ],
          ),
        ),
      ),
    );
  }

  buildExitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: () {
              AppNavigation.goToSignUp(context);
            },
            height: 50.0,
            minWidth: 50.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Icon(
              Icons.chevron_left,
              color: AppTheme.primaryAccentColor,
              size: 35,
            ),
          ),
        )
      ],
    );
  }

  buildSecurityText() {
    return Text(
      "Numéro de téléphone",
      style: TextStyle(
          color: AppTheme.primaryColor,
          fontSize: 21.0,
          fontWeight: FontWeight.bold),
    );
  }

  buildNumberPad() {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  KeyboardNumber(
                      n: 1,
                      onPressed: () {
                        pinIndexSetup("1");
                      }),
                  KeyboardNumber(
                      n: 2,
                      onPressed: () {
                        pinIndexSetup("2");
                      }),
                  KeyboardNumber(
                      n: 3,
                      onPressed: () {
                        pinIndexSetup("3");
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  KeyboardNumber(
                      n: 4,
                      onPressed: () {
                        pinIndexSetup("4");
                      }),
                  KeyboardNumber(
                      n: 5,
                      onPressed: () {
                        pinIndexSetup("5");
                      }),
                  KeyboardNumber(
                      n: 6,
                      onPressed: () {
                        pinIndexSetup("6");
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  KeyboardNumber(
                      n: 7,
                      onPressed: () {
                        pinIndexSetup("7");
                      }),
                  KeyboardNumber(
                      n: 8,
                      onPressed: () {
                        pinIndexSetup("8");
                      }),
                  KeyboardNumber(
                      n: 9,
                      onPressed: () {
                        pinIndexSetup("9");
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 60.0,
                    child: MaterialButton(

                        height: 60.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0),
                        ),

                        onPressed: () {
                          if (numberController.text.length==8){
                            AppNavigation.goToPin(context);
                          }

                        },
                        child: Icon(
                          Icons.check_circle_rounded,
                          size: 30,
                          color: AppTheme.primaryColor,
                        )),
                  ),
                  KeyboardNumber(
                      n: 0,
                      onPressed: () {
                        pinIndexSetup("0");
                      }),
                  Container(
                    width: 60.0,
                    child: MaterialButton(
                        height: 60.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                        onPressed: () {
                          clearPin();
                        },
                        child: Icon(
                          Icons.backspace_outlined,
                          size: 30,
                          color: AppTheme.primaryColor,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  pinIndexSetup(String s) async {
    setPin(pinIndex, s);
  }

  setPin(int n, String text) {
    if (numberController.text.length < 8) numberController.text += text;
  }

  clearPin() {
    if (numberController.text.isNotEmpty &&
        numberController.text != null &&
        numberController.text.length > 0) {
      int length = numberController.text.length;
      numberController.text = numberController.text.substring(0, length - 1);
    }
  }
}

class KeyboardNumber extends StatelessWidget {
  final int n;
  final Function() onPressed;
  KeyboardNumber({this.n, this.onPressed});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: AppTheme.primaryAccentColor),
      alignment: Alignment.center,
      child: MaterialButton(
        padding: EdgeInsets.all(8.0),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        height: 90.0,
        child: Text(
          "$n",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24 * MediaQuery.of(context).textScaleFactor,
              color: AppTheme.whiteColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
