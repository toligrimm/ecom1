import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    required this.id,
    required this.userName,
    required this.password,
  });

  int id;
  String userName;
  String password;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["id"],
    userName: json["userName"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "password": password,
  };
}
