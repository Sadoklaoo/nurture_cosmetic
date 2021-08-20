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
   // return _buildListItem(product);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                AppUtils.capitalizeSentence(product.ProductName),
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppTheme.primaryColor),
              ),
              Text(
                AppUtils.capitalizeSentence(product.Price.toString() + ' DT'),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryAccentColor),
              ),
            ],
          ),
          leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: AppTheme.primaryAccentColor,
              ),
              child: Image.network(AppConfig.URL_GET_IMAGE + product.Image,
                  width: 80, height: 80)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.Categorie.categoryName,
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
                /*  Icon(
                    Icons.arrow_right_alt,
                    size: 50,
                    color: AppTheme.primaryAccentColor,
                  )*/
                ],
              )
            ],
          )),
    );
  }

/*  Container(
  decoration: BoxDecoration(
  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
  color: AppTheme.primaryAccentColor,
  ),
  child: Image.network(AppConfig.URL_GET_IMAGE+product.Image, width: 80, height: 80)),*/

  Widget _buildListItem(Product product) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
       // width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: AppTheme.primaryAccentColor,
                ),
                child: Image.network(AppConfig.URL_GET_IMAGE + product.Image,
                    width: 80, height: 80)),
            SizedBox(width: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      AppUtils.capitalizeSentence(product.ProductName),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryColor),
                    ),
                    Text(
                      AppUtils.capitalizeSentence(
                          product.Price.toString() + ' DT'),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryAccentColor),
                    ),
                  ],
                ),
                Text(
                  product.Categorie.categoryName,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryColor),
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
            )
          ],
        ),
      ),
    );
  }
}
