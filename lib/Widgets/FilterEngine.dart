import 'dart:convert';

import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nurture_cosmetic/Models/Cat.dart';
import 'package:nurture_cosmetic/Models/ProductType.dart';
import 'package:nurture_cosmetic/Models/Session.dart';
import 'package:nurture_cosmetic/Utils/AppApi.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';
import 'package:nurture_cosmetic/Models/FilterSettings.dart';
import 'package:http/http.dart' as http;

class FilterEngine extends StatefulWidget {
  @override
  _FilterEngineState createState() => _FilterEngineState();
}

class _FilterEngineState extends State<FilterEngine> {
  RangeValues _currentRangeValues = const RangeValues(20.0, 1500.0);
  List<bool> isSelected;

  List<Map> _myCategories = [
    {'id': '1', 'image': AppStrings.skin_icon, 'name': "Soins de la peau"},
    {'id': '2', 'image': AppStrings.face_icon, 'name': "Soins de visage"},
    {'id': '3', 'image': AppStrings.hair_icon, 'name': "Soins de cheveaux"},
    {'id': '4', 'image': AppStrings.pers_icon, 'name': "Soins personelles"}
  ];

  List<String> tags = [];
  List<String> options = [
    'Bio',
    'Eco',
    'Naturel',
    'Organique',
    'Vegan',
  ];

  String _currentCat;
  String _currentType;
  Session session;
  List<Cat> _categories;
  List<ProductType> _productType;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    session = new Session();
    isSelected = [true, false];
    setState(() {
      //_categories = await getCategories();
    });
  }

  Future<List<C2Choice<String>>> getChoices() async {
    String tt;
    String url = AppConfig.URL_GET_ALL_PRODUCT_TYPE;
    await session.getToken().then((value) async {
      // Run extra code here
      tt = value;
    }, onError: (error) {
      print(error);
    });
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'auth': '$tt',
    });
    List<dynamic> data = jsonDecode(response.body);
    _productType = data.map((json) => ProductType.fromMap(json)).toList();
    return C2Choice.listFrom<String, dynamic>(
      source: data,
      value: (index, item) => item['TypeName'],
      label: (index, item) => item['TypeName'],
      meta: (index, item) => item,
    )..insert(0, C2Choice<String>(value: 'all', label: 'All'));
  }

  Future<List<Cat>> getCategories() async {
    String tt;
    String url = AppConfig.URL_GET_CATEGORY;
    await session.getToken().then((value) async {
      // Run extra code here
      tt = value;
    }, onError: (error) {
      print(error);
    });
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'auth': '$tt',
    });
    int statusCode = response.statusCode;

    List<dynamic> data = jsonDecode(response.body);
    _categories = data.map((json) => Cat.fromMap(json)).toList();
    return (Future(() => _categories));
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
                          color: AppTheme.primaryColor,
                        )),
                    SizedBox(
                      width: width * 30 / 100,
                    ),
                    Text(
                      'Filtre',
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 3 / 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Center(
                    child: Text("Choisi vos preferences de filtre"),
                  ),
                ),
                SizedBox(
                  height: height * 2 / 100,
                ),
                _buildPriceRange(height),
                _buildOrder(height),
                _buildCategorySelector(height),
                _buildNatureSelector(height),
                _buildConfirmBtn()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPriceRange(double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Text(
          'Marge de prix',
          style: TextStyle(
            color: AppTheme.primaryAccentColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: height * 1 / 100,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Minimum',
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Maximum',
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        RangeSlider(
          values: _currentRangeValues,
          activeColor: AppTheme.primaryAccentColor,
          inactiveColor: AppTheme.greyWhiteColor,
          min: 0,
          max: 1500,
          divisions: 160,
          labels: RangeLabels(
            _currentRangeValues.start.round().toString() + " DT",
            _currentRangeValues.end.round().toString() + " DT",
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
          },
        ),
        Divider(),
      ],
    );
  }

  Widget _buildOrder(double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trier par',
          style: TextStyle(
            color: AppTheme.primaryAccentColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: height * 2 / 100,
        ),
        Center(
          child: ToggleButtons(
              borderColor: AppTheme.primaryAccentColor,
              fillColor: AppTheme.primaryAccentColor,
              borderWidth: 2,
              selectedBorderColor: AppTheme.primaryAccentColor,
              selectedColor: AppTheme.whiteColor,
              highlightColor: AppTheme.primaryAccentColor,
              textStyle:
                  TextStyle(fontSize: 16, color: AppTheme.primaryAccentColor),
              borderRadius: BorderRadius.circular(30),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    'Haut - Bas',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    'Bas - Haut',
                  ),
                ),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    isSelected[i] = i == index;
                  }
                });
              },
              isSelected: isSelected),
        ),
        SizedBox(
          height: height * 2 / 100,
        ),
        Divider(),
      ],
    );
  }

  Widget _buildCategorySelector(double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Catégorie',
          style: TextStyle(
            color: AppTheme.primaryAccentColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: height * 2 / 100,
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: FutureBuilder(
                      future: getCategories(),
                      builder: (context, projectSnap) {
                        if (projectSnap.hasData) {

                          return DropdownButton(
                            hint: Text('Sélectionner une catégorie'),
                            value: _currentCat,
                            onChanged: (newValue) {
                              setState(() {
                                _currentCat = newValue;
                              });
                            },
                            items: _buildCategoryDropdownItem(projectSnap.data),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
        SizedBox(
          height: height * 2 / 100,
        ),
        Divider(),
      ],
    );
  }

  List<DropdownMenuItem> _buildCategoryDropdownItem(List<Cat> list) {
    List<DropdownMenuItem> ll=<DropdownMenuItem>[];
    list.forEach((element) {
      ll.add(DropdownMenuItem(
          value: element.categoryName,
          child: Row(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    AppConfig.URL_GET_IMAGE + element.image,
                    width: 25,
                  ),
                ),
                decoration: BoxDecoration(
                    color: AppTheme.primaryAccentColor,
                    borderRadius: BorderRadius.circular(20)),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Text(
                  element.categoryName,
                  style: TextStyle(),
                ),
              )
            ],
          )));
    });
    return ll;
  }

  Widget _buildNatureSelector(double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nature',
          style: TextStyle(
            color: AppTheme.primaryAccentColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: height * 2 / 100,
        ),
        ChipsChoice<String>.multiple(
          wrapped: true,
          value: tags,
          choiceStyle: C2ChoiceStyle(
              color: Colors.grey,
              elevation: 2.0,
              labelStyle: TextStyle(
                color: Colors.grey,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              )),
          choiceActiveStyle: C2ChoiceStyle(
              color: AppTheme.primaryAccentColor,
              labelStyle: TextStyle(
                color: AppTheme.primaryAccentColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              )),
          onChanged: (val) => setState(() => tags = val),
          choiceItems: null,
          choiceLoader: () => getChoices(),
        ),
        SizedBox(
          height: height * 2 / 100,
        ),
        Divider(),
      ],
    );
  }

  Widget _buildConfirmBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Filter filterSettings = new Filter();
          filterSettings.minPrice = _currentRangeValues.start.toInt();
          filterSettings.maxPrice = _currentRangeValues.end.toInt();
          if(isSelected[0]){
            filterSettings.isNormal =1;
          }else{
            filterSettings.isNormal =-1;
          }

          if(_currentCat!=null){
            filterSettings.category=_categories.firstWhere((element) => element.categoryName==_currentCat);
          }
          if(tags.isNotEmpty){
           if(tags.indexOf('all')!=-1){
            filterSettings.productType  = _productType.map((e) => e.TypeName).toList();

           }else{

             filterSettings.productType = tags;
           }
          }


          Navigator.pop(context,filterSettings);

          //print(filterSettings);

        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: AppTheme.primaryAccentColor,
        child: Text(
          'SOUMETTRE',
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
