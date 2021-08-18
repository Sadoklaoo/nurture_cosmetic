class ProductType {
  int id;
  String TypeName;
  String image;


  ProductType(
      {this.id,
        this.TypeName,
        this.image,

      });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'TypeName': TypeName,
      'Image': image,
    };
    return map;
  }

  ProductType.fromMap(Map<String, dynamic> map) {
    id = map['id'] as int;
    TypeName = map['TypeName'];
    image = map['Image'];
  }


  @override
  String toString() {
    // TODO: implement toString
    return "ProductType {id : " +
        id.toString() +
        "\n TypeName : " +
        TypeName.toString() +
        "\n Image : " +
        image.toString() +
        "}";
  }
}
