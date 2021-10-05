import 'package:nurture_cosmetic/Models/Cat.dart';
import 'package:nurture_cosmetic/Models/ProductType.dart';

class Filter {
  int minPrice;
  int maxPrice;
  int isNormal;
  Cat category;
  List<String> productType;

  @override
  String toString() {
    return "($minPrice,$maxPrice,$isNormal,$category,$productType)";
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'isNormal': isNormal,
    };
    if(category!=null){
      map.putIfAbsent('category', () => category.categoryName);
    }
    if(productType!=null){
      map.putIfAbsent('productType', () => productType);
    }
    return map;
  }
}