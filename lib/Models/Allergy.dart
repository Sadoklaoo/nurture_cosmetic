class Allergy {
  int id;
  String AllergyName;
  String Image;


  Allergy(
      {this.id,
        this.AllergyName,
        this.Image,

      });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'AllergyName': AllergyName,
      'Image': Image,
    };
    return map;
  }

  Allergy.fromMap(Map<String, dynamic> map) {
    id = map['id'] as int;
    AllergyName = map['AllergyName'];
    Image = map['Image'];
  }


  @override
  String toString() {
    // TODO: implement toString
    return "Allergy {id : " +
        id.toString() +
        "\n AllergyName : " +
        AllergyName.toString() +
        "\n Image : " +
        Image.toString() +
        "}";
  }
}
