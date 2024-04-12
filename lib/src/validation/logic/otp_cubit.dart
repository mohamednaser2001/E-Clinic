import 'dart:async';
import 'package:bloc/bloc.dart';
import '../data/repos/generate_otp_repo.dart';
import 'otp_state.dart';

class OTPCubit extends Cubit<OtpStates> {
  OTPValidationRepo generateOTPRepo;
  late String token;
  OTPCubit(this.generateOTPRepo) : super(OtpInitialState());

  void initData(String token){
    this.token= token;
    generateOTP();
  }

  void generateOTP() async {
    emit(GenerateOTPLoadingState());

    final response = await generateOTPRepo.generateOTP(token);

    response.when(success: (generateOTPResponseModel) {
      print(generateOTPResponseModel);

      startTimer();
      emit(GenerateOTPSuccessState());
    }, failure: (error) {
      print(error.apiErrorModel.message);
      emit(GenerateOTPErrorState());
    });
  }



  // Input of user in OTP Screen.
  String? otp;
  void checkOTPAndVerify(){

    if(otp!=null && otp!.trim().length==6){
      verifyOTP(otp!);
    }else{
      // todo error
    }
  }

  void verifyOTP(String otp) async {
    emit(VerifyOTPLoadingState());

    final response = await generateOTPRepo.verifyOTP(
        token, otp);

    response.when(success: (generateOTPResponseModel) {
      print(generateOTPResponseModel);

      startTimer();
      emit(VerifyOTPSuccessState());
    }, failure: (error) {
      print(error.apiErrorModel.message);
      emit(VerifyOTPErrorState());
    });
  }




  late Timer timer;
  String remainingTime = '09:59';
  bool isResendButtonActive = false;

  FutureOr<void> startTimer() {
    // time will count from 09:59
    int seconds = 59;
    int minutes = 9;
    isResendButtonActive = false;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds == 1) {
        if (minutes == 0) {
          timer.cancel();
          remainingTime = '00:00';
          isResendButtonActive = true;
          emit(ChangeTimerState());
          return;
        } else {
          minutes--;
        }
      }
      seconds--;
      if (seconds == 0) {
        seconds = 59;
      }

      remainingTime =
          '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

      emit(ChangeTimerState());
    });
  }
}
