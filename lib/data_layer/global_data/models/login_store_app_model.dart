
import 'dart:convert';

List<UserData> userDataFromJson(String str) => List<UserData>.from(json.decode(str).map((x) => UserData.fromJson(x)));

String userDataToJson(List<UserData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserData {
  final int ?id;
  final String username;
  final String password;

  UserData({
     this.id,
    required this.username,
    required this.password,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"],
    username: json["username"].toString(),
    password: json["password"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id":id,
    "username": username,
    "password": password,
  };
}







