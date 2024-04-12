
import 'package:e_clinic/core/network/api_error_handler.dart';
import 'package:e_clinic/core/network/api_service.dart';
import 'package:e_clinic/src/validation/data/models/generate_otp_response_model.dart';
import 'package:e_clinic/src/authentication/data/models/signup_request_model.dart';
import 'package:e_clinic/src/authentication/data/models/signup_response_model.dart';

import '../../../../core/network/api_result.dart';

class OTPValidationRepo{
  final ApiService _apiService;
  OTPValidationRepo(this._apiService);


  Future<ApiResult<GenerateOTPResponseModel>> generateOTP(String token)async {

    try{
      final response= await _apiService.generateOTP('Bearer $token');
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<GenerateOTPResponseModel>> verifyOTP(String token, String otp)async {

    try{
      Map<String, dynamic> data= {'otp': otp};
      final response= await _apiService.verifyOTP('Bearer $token', data);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}