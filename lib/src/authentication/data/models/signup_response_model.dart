
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/network/user_model.dart';
part 'signup_response_model.g.dart';


@JsonSerializable()
class SignupResponseModel{

  int status;
  String message;
  UserDataModel data;


  SignupResponseModel({required this.message, required this.status, required this.data});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json)
  => _$SignupResponseModelFromJson(json);
}


