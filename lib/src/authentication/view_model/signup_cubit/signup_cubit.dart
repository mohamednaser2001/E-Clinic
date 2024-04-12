import 'package:bloc/bloc.dart';
import 'package:e_clinic/src/authentication/data/models/signup_request_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../data/repos/signup_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupStates> {
  final SignupRepo _signupRepo;

  SignupCubit(this._signupRepo) : super(SignupInitialState());

  // Text form filed controllers.
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var birthDateController = TextEditingController();

  // Gender
  List<String> genders = ['Male', 'Female'];
  String? gender;

  void validateInputsAndSignup(BuildContext context) {
    if (formKey.currentState!.validate() && gender != null) {
      signup();
    }
  }

  void signup() async {
    emit(SignupLoadingState());
    final response = await _signupRepo.signup(SignupRequestModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      password: passwordController.text.trim(),
      birthDate: birthDateController.text.trim(),
      gender: gender!.toLowerCase(),
    ));

    response.when(success: (signupResponse) {
      emit(SignupSuccessState(signupResponse.data.token));
    }, failure: (error) {
      emit(SignupErrorState(error.apiErrorModel.message??''));
    });
  }

  void changeGender(String? value) {
    gender = value;
    emit(ChangeGenderState());
  }
}
