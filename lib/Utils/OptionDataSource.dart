import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:nurture_cosmetic/Models/Option.dart';

import 'AppTheme.dart';
class OptionDataSource extends DataGridSource {
  OptionDataSource({List<Option> employees}) {
    _employees = employees
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'name', value: e.name),
      DataGridCell<String>(columnName: 'normale', value: e.normale),
      DataGridCell<String>(columnName: 'grasse', value: e.grasse),
      DataGridCell<String>(columnName: 'seche', value: e.seche),
      DataGridCell<String>(columnName: 'mixte', value: e.mixte),
      DataGridCell<String>(columnName: 'senescente', value: e.senescente),

    ]))
        .toList();
  }

  List<DataGridRow>  _employees = [];

  @override
  List<DataGridRow> get rows =>  _employees;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
          return Container(
            alignment: (dataGridCell.columnName == 'name' )
                ? Alignment.centerRight
                : Alignment.centerLeft,
            padding: EdgeInsets.all(16.0),
            child: getData(dataGridCell.columnName,dataGridCell.value),
          );
        }).toList());
  }

  Widget getData(String name, String value){
    return (name == 'name' )
        ? Text(value.toString(),style: TextStyle(
        color: AppTheme.primaryColor,
        fontWeight: FontWeight.bold,),)
        : Text(value.toString(),style: TextStyle(
      color: AppTheme.primaryColor,));
  }
}