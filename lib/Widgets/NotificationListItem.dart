import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Utils/AppUtils.dart';

class NotificationListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppUtils.capitalizeSentence('Ce produit est parfait !'),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor),
                  ),
                ],
              ),
              leading: Container(
                  color: AppTheme.primaryAccentColor,
                  child: Icon(
                    Icons.notifications_active,
                    color: AppTheme.whiteColor,
                    size: 40,
                  )),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        color: AppTheme.primaryColor,
                        size: 12,
                      ),
                      Text(
                        ' 30/04/2021 à 14:30',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primaryColor,
                            fontSize: 11),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: new Container(
                          padding: new EdgeInsets.only(right: 13.0),
                          child: new Text(
                            'Un nouveau produit qui correspond à votre type du.',
                            overflow: TextOverflow.ellipsis,
                            style: new TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ));
  }
}
