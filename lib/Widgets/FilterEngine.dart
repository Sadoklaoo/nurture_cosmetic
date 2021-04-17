import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurture_cosmetic/Utils/AppNavigation.dart';
import 'package:nurture_cosmetic/Utils/AppStrings.dart';
import 'package:nurture_cosmetic/Utils/AppTheme.dart';

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
  List<Map> _myTypes = [
    {'id': '1', 'image': AppStrings.creme, 'name': "Crème de beauté"},
    {'id': '2', 'image': AppStrings.cosmetics, 'name': "Cosmétiques"},
    {'id': '3', 'image': AppStrings.parfum, 'name': "Parfums"},
    {'id': '4', 'image': AppStrings.kit, 'name': "Kits cosmétiques"}
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected = [true, false];
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
                      'Filter',
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
                    child: Text(
                        "lorem ipsum is Simply dummy text of the printing and typesetting industry."),
                  ),
                ),
                SizedBox(
                  height: height * 2 / 100,
                ),
                _buildPriceRange(height),
                _buildOrder(height),
                _buildCategorySelector(height),
                _buildProductTypeSelector(height),
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
          divisions: 150,
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
                    child: DropdownButton(
                      hint: Text('Sélectionner une catégorie'),
                      value: _currentCat,
                      onChanged: (newValue) {
                        setState(() {
                          _currentCat = newValue;
                        });
                      },
                      items: _myCategories.map((CategoryItem) {
                        return DropdownMenuItem(
                            value: CategoryItem['id'].toString(),
                            child: Row(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      CategoryItem['image'],
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
                                    CategoryItem['name'],
                                    style: TextStyle(),
                                  ),
                                )
                              ],
                            ));
                      }).toList(),
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

  Widget _buildProductTypeSelector(double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Type de produit',
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
                    child: DropdownButton(
                      hint: Text('Sélectionner un type'),
                      value: _currentType,
                      onChanged: (newValue) {
                        setState(() {
                          _currentType = newValue;
                        });
                      },
                      items: _myTypes.map((ProductTypeItem) {
                        return DropdownMenuItem(
                            value: ProductTypeItem['id'].toString(),
                            child: Row(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      ProductTypeItem['image'],
                                      width: 25,
                                      height: 25,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: AppTheme.primaryAccentColor,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    ProductTypeItem['name'],
                                    style: TextStyle(),
                                  ),
                                )
                              ],
                            ));
                      }).toList(),
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
              )
          ),
          choiceActiveStyle: C2ChoiceStyle(
              color: AppTheme.primaryAccentColor,
              labelStyle: TextStyle(
                color: AppTheme.primaryAccentColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              )
          ),
          onChanged: (val) => setState(() => tags = val),
          choiceItems: C2Choice.listFrom<String, String>(
            source: options,
            value: (i, v) => v,
            label: (i, v) => v,
          ),
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
          Navigator.pop(context);
          print(_currentRangeValues.start);
          print(_currentRangeValues.end);
          print(isSelected);
          print(_currentCat);
          print(_currentType);
          print(tags);
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
