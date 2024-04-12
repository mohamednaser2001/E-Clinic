
import 'package:json_annotation/json_annotation.dart';

part 'signup_request_model.g.dart';

@JsonSerializable()
class SignupRequestModel{
  String name;
  String email;
  String phone;
  String password;

  @JsonKey(name: 'birthdate')
  String birthDate;
  String gender;

  SignupRequestModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.birthDate,
      required this.gender,
      });


  Map<String, dynamic> toJson()=> _$SignupRequestModelToJson(this);
}