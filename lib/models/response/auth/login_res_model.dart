import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    required this.id,
    required this.userToken,
    required this.profile,
    required this.uid,
    required this.username,
  });

  final String id;
  final String userToken;
  final String profile;
  final String username;
  final String uid;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        id: json["_id"],
        userToken: json["userToken"],
        profile: json["profile"],
        uid: json["uid"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userToken": userToken,
    "profile": profile,
    "uid": uid,
    "username": username,
  };
}
