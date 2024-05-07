
import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_model.g.dart';

@JsonSerializable()
class EditProfileModel {
  final String? message;
  final int? code;

  EditProfileModel({
    required this.message,
    this.code,
  });

  factory EditProfileModel.fromJson(Map<String, dynamic> json) =>
      _$EditProfileModelFromJson(json);

  // Map<String, dynamic> toJson() => _$EditProfileModelToJson(this);
}