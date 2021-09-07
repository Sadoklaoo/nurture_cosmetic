class SkinType {
  int id;
  String SkinTypeName;



  SkinType(
      {this.id,
        this.SkinTypeName,


      });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'SkinTypeName': SkinTypeName,

    };
    return map;
  }

  SkinType.fromMap(Map<String, dynamic> map) {
    id = map['id'] as int;
    SkinTypeName = map['SkinTypeName'];

  }


  @override
  String toString() {
    // TODO: implement toString
    return "ProductType {id : " +
        id.toString() +
        "\n SkinTypeName : " +
        SkinTypeName.toString() +

        "}";
  }
}
