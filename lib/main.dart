
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_clinic/core/network/api_service.dart';
import 'package:e_clinic/src/authentication/data/models/signup_request_model.dart';
import 'package:e_clinic/src/authentication/data/models/signup_response_model.dart';
import 'package:e_clinic/src/authentication/ui/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/dependency_injection/dependency_injection.dart';
import 'core/network/dio_factory.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'e_clinic_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initGetIt();
  // Bloc.observer = MyBlocObserver();

  runApp(const ClinicApp());
}


