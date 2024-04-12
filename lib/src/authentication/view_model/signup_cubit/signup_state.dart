part of 'signup_cubit.dart';

@immutable
abstract class SignupStates {}

class SignupInitialState extends SignupStates {}

// Sign up states
class SignupLoadingState extends SignupStates {}
class SignupSuccessState extends SignupStates {
  String token;
  SignupSuccessState(this.token);
}
class SignupErrorState extends SignupStates {
  String error;
  SignupErrorState(this.error);
}

class ChangeGenderState extends SignupStates {}
