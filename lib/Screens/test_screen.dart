import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
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

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: height * 10 / 100,
            ),
            Image.asset(
              "assets/images/test_icon.png",
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: height * 5 / 100,
            ),
            Text(
              'Découvrez votre peau',
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: height * 5 / 100,
            ),
            Text(
              'Grâce a ce diagnostic vous pourrez enfin comprendre votre peau et trouvez les soins adaptés à ses besoins.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: height * 20 / 100,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSkipBtn(),
                _buildTakeBtn()
              ],
            )
          ],
        ),
      ),
    );
  }


  Widget _buildSkipBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => AppNavigation.goToHome(context),
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
        onPressed: () => AppNavigation.goToTake(context),
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
}
