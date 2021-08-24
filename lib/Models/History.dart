import 'package:nurture_cosmetic/Models/Ingredient.dart';
import 'package:nurture_cosmetic/Models/ProductType.dart';
import 'package:nurture_cosmetic/Models/Cat.dart';
import 'package:nurture_cosmetic/Utils/AppUtils.dart';

import 'Product.dart';

class History {
  int id;
  String searchString;
  DateTime consultedAt;
  List<Product> ConsultedProducts;

  History({
    this.id,
    this.searchString,
    this.consultedAt,
    this.ConsultedProducts,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'SearchString': searchString,
      'consultedAt': consultedAt,
      'ConsultedProducts': [
        ConsultedProducts.forEach((element) {
          return element.toMap();
        })
      ],
    };
    return map;
  }

  History.fromMap(Map<String, dynamic> map) {
    id = map['id'] as int;
    searchString = map['SearchString'];
    consultedAt = AppUtils.convertStringToDateTime(map['consultedAt']);

    if (map["ConsultedProducts"] != null) {
      ConsultedProducts = List<Product>.from(
          map["ConsultedProducts"].map((x) => Product.fromMap(x)));
    }
    /* */
  }

  @override
  String toString() {
    // TODO: implement toString
    return "History {id : " + id.toString() + "}";
  }
}
