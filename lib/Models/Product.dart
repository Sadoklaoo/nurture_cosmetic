


import 'package:nurture_cosmetic/Models/Ingredient.dart';
import 'package:nurture_cosmetic/Models/ProductType.dart';
import 'package:nurture_cosmetic/Models/Cat.dart';
import 'package:nurture_cosmetic/Models/SkinType.dart';
import 'package:nurture_cosmetic/Models/Cat.dart';


class Product {
  int id;
  String ProductName;
  String Reference;
  int Price;
  int Rank;
  String Image;
  String ProductShortDescription;
  String usingAdvice;
  List<SkinType> SkinTypes;
  List<Cat> Categories;
  List<ProductType> types;
  List<Ingredient> ingredients;

  Product(
      {this.id,
      this.ProductName,
      this.Reference,
      this.Price,
      this.Rank,
      this.Image,
      this.ProductShortDescription,
      this.usingAdvice,
      this.SkinTypes,
      this.Categories,
      this.ingredients
      });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'ProductName': ProductName,
      'Reference': Reference,
      'Price': Price,
      'Rank': Rank,
      'Image': Image,
      'ProductShortDescription': ProductShortDescription,
      'usingAdvice': usingAdvice,
      'SkinTypes': [SkinTypes.forEach((element) {
    return element.toMap();
    })],
      'Categories': [Categories.forEach((element) {
        return element.toMap();
      })],
      'ProductIngredients': [ingredients.forEach((element) {
        return element.toMap();
      })],

    };
    return map;
  }

  Product.fromMap(Map<String, dynamic> map) {
    id = map['id'] as int;
    ProductName = map['ProductName'];
    Reference = map['Reference'];
    Price = map['Price'];
    Rank = map['Rank'] as int;
    Image = map['Image'];
    ProductShortDescription = map['ProductShortDescription'];
    usingAdvice = map['usingAdvice'];

    if (map["Categories"]!=null){
      Categories = List<Cat>.from(map["Categories"]
          .map((x) => Cat.fromMap(x)));
    }
    if (map["SkinTypes"]!=null){
      SkinTypes = List<SkinType>.from(map["SkinTypes"]
          .map((x) => SkinType.fromMap(x)));
    }
    if (map["Type"]!=null){
      types = List<ProductType>.from(map["Type"]
          .map((x) => ProductType.fromMap(x)));
    }

    if (map["ProductIngredients"]!=null){
      ingredients = List<Ingredient>.from(map["ProductIngredients"]
          .map((x) => Ingredient.fromMap(x)));
    }
   /* */
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Product {id : " +
        id.toString() +
        "\n ProductName : " +
        ProductName.toString() +
        "\n Image : " +
        Image.toString() +
        "}";
  }
}
