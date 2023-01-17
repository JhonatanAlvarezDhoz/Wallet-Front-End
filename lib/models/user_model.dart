import 'dart:convert';

class UserModel {
  UserModel({
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.phone,
    this.isSubscribe,
    this.isFree,
  });

  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? phone;
  bool? isSubscribe;
  bool? isFree;

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        isSubscribe: json["is_subscribe"],
        isFree: json["is_free"],
      );

  Map<String, dynamic> toMap() => {
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "email": email,
        "phone": phone,
        "is_subscribe": isSubscribe,
        "is_free": isFree,
      };
}
