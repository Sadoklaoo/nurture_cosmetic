

import 'package:nurture_cosmetic/Models/Ingredient.dart';
import 'package:nurture_cosmetic/Models/ProductType.dart';
import 'package:nurture_cosmetic/Models/Cat.dart';


class Product {
  int id;
  String ProductName;
  String Reference;
  int Price;
  int Rank;
  String Image;
  String ProductDescription;
  String ProductSecondDescription;
  String ProductDimensions;
  String PreferedSkinType;
  Cat Categorie;
  List<ProductType> types;
  List<Ingredient> ingredients;

  Product(
      {this.id,
      this.ProductName,
      this.Reference,
      this.Price,
      this.Rank,
      this.Image,
      this.ProductDescription,
      this.ProductSecondDescription,
      this.ProductDimensions,
      this.PreferedSkinType,
      this.Categorie,
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
      'ProductDescription': ProductDescription,
      'ProductSecondDescription': ProductSecondDescription,
      'ProductDimensions': ProductDimensions,
      'PreferedSkinType': PreferedSkinType,
      'Category': Categorie.toMap(),
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
    ProductDescription = map['ProductDescription'];
    ProductSecondDescription = map['ProductSecondDescription'];
    ProductDimensions = map['ProductDimensions'];
    PreferedSkinType = map['PreferedSkinType'];
    if (map["Category"]!=null){
    Categorie = Cat.fromMap(map['Category']);
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
        "\n Categorie : " +
        Categorie.toString() +
        "\n ProductIngredients : " +
        ingredients.toString() +
        "}";
  }
}
