// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_otp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateOTPResponseModel _$GenerateOTPResponseModelFromJson(
        Map<String, dynamic> json) =>
    GenerateOTPResponseModel(
      message: json['message'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$GenerateOTPResponseModelToJson(
        GenerateOTPResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
