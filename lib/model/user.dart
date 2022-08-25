import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.username = "",
    this.email = "",
    this.location = "",
    this.password = "",
  });

  String username='';
  String email='';
  String location='';
  String password='';

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    username: json["Username"],
    email: json["Email"],
    location: json["Location"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "Username": username,
    "Email": email,
    "Location": location,
    "password": password,
  };
}