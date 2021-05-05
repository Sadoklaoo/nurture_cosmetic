import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:nurture_cosmetic/Widgets/UnorderedListWidget.dart';

import 'AppTheme.dart';

class AppDesign {
  static Widget buildBlock(RichText text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [text],
            ),
          )),
    );
  }

  static Widget buildBlockTitleList(
      String title, String desc, List<String> list) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: AppTheme.primaryAccentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  desc,
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                UnorderedList(list),
              ],
            ),
          )),
    );
  }

  static Widget buildNormalBlock(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: AppTheme.primaryAccentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  desc,
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
    );
  }

  static Widget buildNormalBlockMultiple(String title, RichText text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: AppTheme.primaryAccentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                text,
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
    );
  }
  static Widget buildBlockTitleListImage(String title, String desc,
      List<String> list, String imageLink, String imgtag) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: AppTheme.primaryAccentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  desc,
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                UnorderedList(list),
                SizedBox(
                  height: 10,
                ),
                FullScreenWidget(
                  child: Center(
                    child: Hero(
                      tag: imgtag,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            imageLink,
                            fit: BoxFit.fitWidth,
                          )),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  static Widget buildBlockTitleListText(
      String title, String desc, List<String> list, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: AppTheme.primaryAccentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  desc,
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                UnorderedList(list),
                SizedBox(
                  height: 5,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                  ),
                ),
              ],
            ),
          )),
    );
  }
  static Widget buildBlockTitle2ListText(
      String title, String desc, List<String> list,String middle, List<String> list2,String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: AppTheme.primaryAccentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  desc,
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                UnorderedList(list),
                Text(
                  middle,
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                UnorderedList(list2),
                SizedBox(
                  height: 10,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                  ),
                ),
              ],
            ),
          )),
    );
  }

  static Widget buildBlockTitle2List(
      String title, String desc, List<String> list,String middle, List<String> list2) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: AppTheme.primaryAccentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  desc,
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                UnorderedList(list),
                Text(
                  middle,
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                UnorderedList(list2),

              ],
            ),
          )),
    );
  }

  static Widget buildItem(String item, String desc) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("• "),
            Expanded(
              child: Text(
                item,
                style: TextStyle(
                  color: AppTheme.primaryColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          desc,
          style: TextStyle(
            color: AppTheme.primaryColor,
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
