import 'package:nurture_cosmetic/Utils/AppUtils.dart';

class User {
  int id;
  String firstName;
  String lastName;
  String email;
  int phoneNumber;
  DateTime birthDate;
  String password;
  String sexe;
  DateTime createdAt;
  DateTime updatedAt;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.sexe,
        this.phoneNumber,
        });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'sexe': sexe,
      'birthDate': birthDate.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map['id'] as int;
    firstName = map['firstName'];
    lastName = map['lastName'];
    email = map['email'];
    sexe = map['sexe'];
    phoneNumber = map['phoneNumber'] as int;
    updatedAt = AppUtils.convertStringToDateTime(map['updatedAt']);
    birthDate = AppUtils.convertStringToDateTime(map['birthDate']);
    createdAt = AppUtils.convertStringToDateTime(map['createdAt']);
  }


  @override
  String toString() {
    // TODO: implement toString
    return "User {id : " +
        id.toString() +
        "\n firstName : " +
        firstName.toString() +
        "\n lastName : " +
        lastName.toString() +
        "\n sexe : " +
        sexe.toString() +
        "\n email : " +
        email.toString() +
        "\n phoneNumber : " +
        phoneNumber.toString() +
        "\n birthDate : " +
        birthDate.toString() +
        "\n createdAt : " +
        createdAt.toString() +
        "\n updatedAt : " +
        updatedAt.toString() +
        "}";
  }
}
