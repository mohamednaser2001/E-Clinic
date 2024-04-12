import 'package:json_annotation/json_annotation.dart';

import '../../../../core/network/user_model.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  bool success;
  int status;
  String message;
  UserDataModel data;

  LoginResponseModel({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

