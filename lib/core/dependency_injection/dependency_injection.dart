
import 'package:dio/dio.dart';
import 'package:e_clinic/core/network/dio_factory.dart';
import 'package:e_clinic/src/login/data/repos/login_repo.dart';
import 'package:e_clinic/src/validation/data/repos/generate_otp_repo.dart';
import 'package:e_clinic/src/authentication/data/repos/signup_repo.dart';
import 'package:e_clinic/src/authentication/data/repos/signup_repo.dart';
import 'package:e_clinic/src/login/logic/login_cubit.dart';
import 'package:e_clinic/src/validation/logic/otp_cubit.dart';
import 'package:e_clinic/src/authentication/view_model/signup_cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

import '../network/api_service.dart';

final getIt = GetIt.instance;

Future<void> initGetIt()async {
  // Init Dio
  Dio dio= DioFactory.getDio();

  // Init Api Service
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));


  // sign up cubit
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));


  // Login cubit & Repo
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));


  // OTP cubit and repo
  getIt.registerLazySingleton<OTPValidationRepo>(() => OTPValidationRepo(getIt()));
  getIt.registerFactory<OTPCubit>(() => OTPCubit(getIt()));
}
