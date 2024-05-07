
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_clinic/core/network/api_error_handler.dart';
import 'package:e_clinic/core/network/api_service.dart';
import '../../../../core/network/api_result.dart';
import 'edit_profile_model.dart';


class EditProfileRepo{
  final ApiService _apiService;
  EditProfileRepo(this._apiService);


  Future<ApiResult<EditProfileModel>> uploadImage(String token, FormData formData)async {

    try{
      final response= await _apiService.uploadProfileImage('Bearer $token', formData);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}


