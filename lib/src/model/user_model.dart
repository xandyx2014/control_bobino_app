import 'dart:convert';

UserModel userModelFromJson(String str) {
  final jsonData = json.decode(str);
  return UserModel.fromJson(jsonData);
}

String userModelToJson(UserModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class UserModel {
  int id;
  String username;
  String password;
  String nombre;
  String updatedAt;
  String createdAt;

  UserModel({
    this.id,
    this.username,
    this.password,
    this.nombre,
    this.updatedAt,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => new UserModel(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        nombre: json["nombre"],
        updatedAt: json["updatedAt"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "nombre": nombre,
        "updatedAt": updatedAt,
        "createdAt": createdAt,
      };
  @override
  String toString() {
    return this.toJson().toString();
  }
}
