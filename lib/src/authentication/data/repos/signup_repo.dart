
import 'package:e_clinic/core/network/api_error_handler.dart';
import 'package:e_clinic/core/network/api_service.dart';
import 'package:e_clinic/src/authentication/data/models/signup_request_model.dart';
import 'package:e_clinic/src/authentication/data/models/signup_response_model.dart';

import '../../../../core/network/api_result.dart';

class SignupRepo{
  final ApiService _apiService;
  SignupRepo(this._apiService);
  Future<ApiResult<SignupResponseModel>> signup(SignupRequestModel signupRequestModel)async {

    try{
      final response= await _apiService.signup(signupRequestModel);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}