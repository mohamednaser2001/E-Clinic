
import 'package:dio/dio.dart';
import 'package:e_clinic/core/network/api_constants.dart';
import 'package:e_clinic/src/login/data/models/login_request_model.dart';
import 'package:e_clinic/src/login/data/models/login_response_model.dart';
import 'package:e_clinic/src/validation/data/models/generate_otp_response_model.dart';
import 'package:e_clinic/src/authentication/data/models/signup_request_model.dart';
import 'package:retrofit/http.dart';
import '../../src/authentication/data/models/signup_response_model.dart';
part 'api_service.g.dart';



@RestApi(baseUrl: ApiConstants.baseUrl) // retrofit
abstract class ApiService{

  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // Sign up
  @POST(ApiConstants.signup) //retrofit annotations
  Future<SignupResponseModel> signup(@Body() SignupRequestModel signupRequestModel,);


  // Login
  @POST(ApiConstants.login) //retrofit annotations
  Future<LoginResponseModel> login(@Body() LoginRequestModel loginRequestModel,);


  @POST(ApiConstants.generateOTP)
  Future<GenerateOTPResponseModel> generateOTP(@Header('Authorization') String token);


  @POST(ApiConstants.verifyOTP)
  Future<GenerateOTPResponseModel> verifyOTP(@Header('Authorization') String token, @Body() Map<String, dynamic> body);
}