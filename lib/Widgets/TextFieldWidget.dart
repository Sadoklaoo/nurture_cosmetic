


import 'package:flutter/material.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';

final kHintTextStyle = TextStyle(
  color: AppTheme.primaryColor,
  fontSize: 15,
  fontWeight: FontWeight.bold,

);
final kTextStyle = TextStyle(
    color: AppTheme.greyColor,
    fontSize: 15,
    fontWeight: FontWeight.bold
);

final kLabelStyle = TextStyle(
  color: AppTheme.primaryAccentColor,

  fontWeight: FontWeight.bold,
);

final kBoxDecorationStyle = BoxDecoration(
  color: AppTheme.whiteColor,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);