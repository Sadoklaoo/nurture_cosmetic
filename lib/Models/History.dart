import 'package:nurture_cosmetic/Models/Ingredient.dart';
import 'package:nurture_cosmetic/Models/ProductType.dart';
import 'package:nurture_cosmetic/Models/Cat.dart';
import 'package:nurture_cosmetic/Utils/AppUtils.dart';

import 'Product.dart';

class History {
  int id;
  DateTime consultedAt;
  Product ConsultedProduct;

  History({
    this.id,
    this.consultedAt,
    this.ConsultedProduct,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'consultedAt': consultedAt,
      'ConsultedProduct': ConsultedProduct.toMap(),
    };
    return map;
  }

  History.fromMap(Map<String, dynamic> map) {
    id = map['id'] as int;
    consultedAt = AppUtils.convertStringToDateTime(map['consultedAt']);

    if (map["ConsultedProduct"] != null) {
      ConsultedProduct = Product.fromMap(map['ConsultedProduct']);
    }
    /* */
  }

  @override
  String toString() {
    // TODO: implement toString
    return "History {id : " + id.toString() + "}";
  }
}
