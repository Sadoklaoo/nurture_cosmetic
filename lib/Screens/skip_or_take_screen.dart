import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';

class SkipOrTakeScreen extends StatefulWidget {
  @override
  _SkipOrTakeScreenState createState() => _SkipOrTakeScreenState();
}

class _SkipOrTakeScreenState extends State<SkipOrTakeScreen> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  int _environment = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _environment = value;

      switch (_environment) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
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
              image: AssetImage("assets/images/blurry_bg.png"),
              fit: BoxFit.cover)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stepper(
              type: stepperType,
              physics: ScrollPhysics(),
              currentStep: _currentStep,
              onStepTapped: (step) => tapped(step),
              onStepContinue: continued,
              onStepCancel: cancel,
              steps: <Step>[
                Step(
                  title: new Text('Mon Environement'),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          new Radio(
                            value: 0,
                            groupValue: _environment,
                            onChanged: _handleRadioValueChange,
                          ),
                          new Text(
                            'Second',
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      new Radio(
                        value: 1,
                        groupValue: _environment,
                        onChanged: _handleRadioValueChange,
                      ),
                      new Text(
                        'Second',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      new Radio(
                        value: 2,
                        groupValue: _environment,
                        onChanged: _handleRadioValueChange,
                      ),
                      new Text(
                        'Last',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: new Text('Address'),
                  content: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Home Address'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Postcode'),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 1
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: new Text('Mobile Number'),
                  content: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Mobile Number'),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 2
                      ? StepState.complete
                      : StepState.disabled,
                ),
              ],
            ),
          ]),
    ));
  }

  Widget _buildSkipBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => AppNavigation.goToIntro(context),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: AppTheme.whiteColor,
        child: Text(
          'Passer',
          style: TextStyle(
            color: AppTheme.primaryColor,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTakeBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => AppNavigation.goToTest(context),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: AppTheme.primaryAccentColor,
        child: Text(
          'Démarrer',
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

  Widget _buildStepRadio(int value, int groupValue, Function() methodCall){
    return Row(
      children: [
        new Radio(
          value: value,
          groupValue: groupValue,
          onChanged: methodCall,
        ),
        new Text(
          'Second',
          style: new TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
