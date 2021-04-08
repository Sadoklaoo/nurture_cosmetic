import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';

import 'ProductListItem.dart';

class FilterEngine extends StatefulWidget {
  @override
  _FilterEngineState createState() => _FilterEngineState();

}

class _FilterEngineState extends State<FilterEngine>{

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
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.close,
                          size: 30,
                          color: AppTheme.primaryAccentColor,
                        )),
                    SizedBox(
                      width: width * 35 / 100,
                    ),
                    Text('Filter')

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

              ],
            ),
          ),
        ),
      ),
    );
  }
}