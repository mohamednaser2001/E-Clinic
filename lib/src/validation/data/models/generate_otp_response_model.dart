

import 'package:freezed_annotation/freezed_annotation.dart';
part 'generate_otp_response_model.g.dart';

@JsonSerializable()
class GenerateOTPResponseModel{
  String? message;
  int? status;

  GenerateOTPResponseModel({required this.message, required this.status});

  factory GenerateOTPResponseModel.fromJson(Map<String, dynamic> json)
  => _$GenerateOTPResponseModelFromJson(json);

}