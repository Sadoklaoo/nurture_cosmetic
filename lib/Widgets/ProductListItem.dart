import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:nurture_cosmetic/Models/Product.dart';
import 'package:nurture_cosmetic/Utils/AppApi.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Utils/AppUtils.dart';

class ProductListItem extends StatelessWidget {
  Product product;
  ProductListItem(this.product);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppUtils.capitalizeSentence(product.ProductName),
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppTheme.primaryColor),
              ),
              Text(
                AppUtils.capitalizeSentence(product.Price.toString()+' DT'),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryAccentColor),
              ),
            ],
          ),
          leading: Container(
            color: AppTheme.primaryAccentColor,
              child: Image.network(AppConfig.URL_GET_IMAGE+product.Image, width: 80, height: 80)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Eau de parfum',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: AppTheme.primaryColor),
              ),
              Row(
                children: [
                  Flexible(
                    child: AutoSizeText(
                      product.ProductDescription,
                      maxLines: 3,
                      overflow: TextOverflow.visible,
                      softWrap: true,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: AppTheme.primaryColor),
                    ),
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    size: 50,
                    color: AppTheme.primaryAccentColor,
                  )
                ],
              )
            ],
          )),
    );
  }
}
