
abstract class OtpStates {}

class OtpInitialState extends OtpStates {}
class ChangeTimerState extends OtpStates {}

// Generate otp states
class GenerateOTPLoadingState extends OtpStates {}
class GenerateOTPSuccessState extends OtpStates {}
class GenerateOTPErrorState extends OtpStates {}



// Verify otp states
class VerifyOTPLoadingState extends OtpStates {}
class VerifyOTPSuccessState extends OtpStates {}
class VerifyOTPErrorState extends OtpStates {}