class Ingredient {
  int id;
  String IngredientName;
  String IngredientType;


  Ingredient(
      {this.id,
        this.IngredientName,
        this.IngredientType,

      });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'IngredientName': IngredientName,
      'IngredientType': IngredientType,
    };
    return map;
  }

  Ingredient.fromMap(Map<String, dynamic> map) {
    id = map['id'] as int;
    IngredientName = map['IngredientName'];
    IngredientType = map['IngredientType'];
  }


  @override
  String toString() {
    // TODO: implement toString
    return "Ingredient {id : " +
        id.toString() +
        "\n IngredientName : " +
        IngredientName.toString() +
        "\n IngredientType : " +
        IngredientType.toString() +
        "}";
  }
}
