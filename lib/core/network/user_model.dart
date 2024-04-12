


import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserDataModel {
  String token;
  User user;

  UserDataModel({
    required this.token,
    required this.user,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}

@JsonSerializable()
class User {
  int id;
  String email;
  String name;
  String phone;
  String birthdate;
  String gender;
  String role;
  @JsonKey(name: 'email_verified')
  bool emailVerified;
  String? image; // Nullable

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.birthdate,
    required this.gender,
    required this.role,
    required this.emailVerified,
    this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}