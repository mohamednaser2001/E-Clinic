import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_clinic/src/login/data/models/login_request_model.dart';
import 'package:e_clinic/src/login/data/repos/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this._loginRepo) : super(LoginInitialState());

  final LoginRepo _loginRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  // check if the inputs are null.
  void validateInputsAndLogin() {
    if (formKey.currentState!.validate()) {
      login();
    }
  }


  void login()async {
    emit(LoginLoadingState());

    final response = await _loginRepo.login(
        LoginRequestModel(email: emailController.text.trim(),
            password: passwordController.text.trim()));

    response.when(success: (signupResponse) {
      print('===success ${signupResponse.data.token}');
      emit(LoginSuccessState());
    }, failure: (error) {
      emit(LoginErrorState(error.apiErrorModel.message??''));
    });
  }

}
