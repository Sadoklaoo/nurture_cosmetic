class Categorie {
  int id;
  String categoryName;
  String image;


  Categorie(
      {this.id,
        this.categoryName,
        this.image,

        });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'CategoryName': categoryName,
      'Image': image,
    };
    return map;
  }

  Categorie.fromMap(Map<String, dynamic> map) {
    id = map['id'] as int;
    categoryName = map['CategoryName'];
    image = map['Image'];
  }


  @override
  String toString() {
    // TODO: implement toString
    return "Category {id : " +
        id.toString() +
        "\n CategoryName : " +
        categoryName.toString() +
        "\n Image : " +
        image.toString() +
        "}";
  }
}
