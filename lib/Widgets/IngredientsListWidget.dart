import 'package:flutter/material.dart';
import 'package:nurture_cosmetic/Models/Ingredient.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';

class IngredientsList extends StatelessWidget {
  IngredientsList(this.ingredients);
  final List<Ingredient> ingredients;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var ingredient in ingredients) {
      // Add list item
      widgetList.add(UnorderedListItem(ingredient.IngredientName,ingredient.IngredientType));
      // Add space between items
      widgetList.add(SizedBox(height: 5.0));
    }

    return Column(children: widgetList);
  }
}

class UnorderedListItem extends StatelessWidget {
  UnorderedListItem(this.keyy,this.value);
  final String keyy;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("• ",style: TextStyle(color: AppTheme.whiteColor),),
        basedOnKey(),
      ],
    );
  }

  Widget basedOnKey(){
    if  (value == "LOW"){
      return  Expanded(
        child: Text(keyy,style: TextStyle(
          color: AppTheme.lowColor,
        ),),
      );
    }
    else if  (value == "MEDIUM"){
      return  Expanded(
        child: Text(keyy,style: TextStyle(
          color: AppTheme.mediumColor,
        ),),
      );
    }
    else if  (value == "HIGH"){
      return  Expanded(
        child: Text(keyy,style: TextStyle(
          color: AppTheme.highColor,
        ),),
      );
    }
    else {
      return  Expanded(
        child: Text(keyy,style: TextStyle(
          color: AppTheme.whiteColor,
        ),),
      );
    }

  }
}