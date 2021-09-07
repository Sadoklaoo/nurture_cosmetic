import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:nurture_cosmetic/Models/Cat.dart';
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
      padding: const EdgeInsets.only(bottom: 5.0),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: AutoSizeText(
                product.ProductName,
                maxLines: 3,
                overflow: TextOverflow.visible,
                softWrap: true,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppTheme.primaryColor),
              ),
            ),
          ],
        ),
        leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: AppTheme.primaryAccentColor,
            ),
            child: Image.network(AppConfig.URL_GET_IMAGE + product.Image,
                width: 80, height: 80)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCategories(product.Categories),
            Row(
              children: [
                Flexible(
                  child: AutoSizeText(
                    product.ProductShortDescription,
                    maxLines: 2,
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
        ),
        trailing: Icon(
          Icons.add_circle,
          size: 20,
          color: AppTheme.primaryAccentColor,
        ),
      ),
    );
  }

  buildCategories(List<Cat> categories) {
    var categoriesNames = "";
    if (categories.length != 0) {
      categoriesNames = categories[0].categoryName;
      if (categories.length > 1) {

        var i = 0;
        categories.forEach((element) {
          if(i > 0){
            categoriesNames +=", "+element.categoryName;
          }
          i++;
        });
      }
      return Row(
        children: [
          Flexible(
            child: AutoSizeText(
              categoriesNames,
              maxLines: 2,
              overflow: TextOverflow.visible,
              softWrap: true,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryColor),
            ),
          ),
        ],
      );
    }
  }

/*  Container(
  decoration: BoxDecoration(
  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
  color: AppTheme.primaryAccentColor,
  ),
  child: Image.network(AppConfig.URL_GET_IMAGE+product.Image, width: 80, height: 80)),*/

  // Widget _buildListItem(Product product) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 12.0),
  //     child: Container(
  //      // width: MediaQuery.of(context).size.width,
  //       child: Row(
  //         mainAxisSize: MainAxisSize.max,
  //         children: [
  //           Container(
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.only(
  //                     topLeft: Radius.circular(20),
  //                     topRight: Radius.circular(20)),
  //                 color: AppTheme.primaryAccentColor,
  //               ),
  //               child: Image.network(AppConfig.URL_GET_IMAGE + product.Image,
  //                   width: 80, height: 80)),
  //           SizedBox(width: 20),
  //           Column(
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 crossAxisAlignment: CrossAxisAlignment.end,
  //                 children: [
  //                   Text(
  //                     AppUtils.capitalizeSentence(product.ProductName),
  //                     style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         color: AppTheme.primaryColor),
  //                   ),
  //                   Text(
  //                     AppUtils.capitalizeSentence(
  //                         product.Price.toString() + ' DT'),
  //                     style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         color: AppTheme.primaryAccentColor),
  //                   ),
  //                 ],
  //               ),
  //               Text(
  //                 product.Categorie.categoryName,
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.w600,
  //                     color: AppTheme.primaryColor),
  //               ),
  //               Row(
  //                 children: [
  //                   Flexible(
  //                     child: AutoSizeText(
  //                       product.ProductShortDescription,
  //                       maxLines: 3,
  //                       overflow: TextOverflow.visible,
  //                       softWrap: true,
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.normal,
  //                           color: AppTheme.primaryColor),
  //                     ),
  //                   ),
  //                   Icon(
  //                 Icons.arrow_right_alt,
  //                 size: 50,
  //                 color: AppTheme.primaryAccentColor,
  //               )
  //                 ],
  //               )
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
