import 'dart:async';
import 'package:e_clinic/core/widgets/custom_loading.dart';
import 'package:e_clinic/src/validation/ui/widgets/otp_loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../logic/otp_cubit.dart';
import '../../logic/otp_state.dart';

class OTPScreen extends StatelessWidget {
  TextEditingController pinFieldController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'OTP Verification',
                  style: AppStyles.font24BlueBold,
                ),
                verticalSpace(14),
                Text(
                  'Enter the OTP sent to: ',
                  style: AppStyles.font14GrayRegular,
                ),
                Text(
                  'mohamed@gmail.com',
                  style: AppStyles.font14GrayRegular,
                ),

                verticalSpace(100),

                BlocBuilder<OTPCubit, OtpStates>(
                  builder: (context, state) {
                    return state is GenerateOTPLoadingState
                        ? const OTPLoadingShimmer()
                        : Column(
                      children: [
                        Form(
                          key: formKey,
                          child: PinCodeTextField(
                            appContext: context,
                            pastedTextStyle: const TextStyle(
                              color: AppColors.mainBlue,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 6,
                            animationType: AnimationType.fade,
                            validator: (v) {
                              if (v!.length < 6) {
                                return "Enter 6 numbers";
                              } else {
                                return null;
                              }
                            },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(6.r),
                              activeFillColor: Colors.white,
                              activeColor: Colors.black,
                              inactiveColor: AppColors.lightGray,
                              selectedColor: AppColors.mainBlue,
                            ),
                            cursorColor: Colors.black,
                            animationDuration: const Duration(milliseconds: 300),
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20.sp,
                            ),
                            errorAnimationController: errorController,
                            controller: pinFieldController,
                            keyboardType: TextInputType.number,
                            onCompleted: (value) {
                              context.read<OTPCubit>().otp = value.trim();
                            },
                            onChanged: (value) {},
                            beforeTextPaste: (text) {
                              return true;
                            },
                          ),
                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            BlocBuilder<OTPCubit, OtpStates>(
                                builder: (context, state) {
                                  return context.read<OTPCubit>().remainingTime=='00:00'? Row(
                                  children: [
                                    Text(
                                      'Do\'t receive it? ',
                                      style: AppStyles.font14GreyMedium,
                                    ),
                                    CustomTextButton(
                                      onPressed: () {
                                        context.read<OTPCubit>().generateOTP();
                                      },
                                      text: 'Resend',
                                    ),
                                  ],
                                ) : const SizedBox();
                              }
                            ),

                            const Spacer(),
                            BlocBuilder<OTPCubit, OtpStates>(
                              builder: (context, state) {
                                return Text(
                                  context.read<OTPCubit>().remainingTime,
                                  style: AppStyles.font13BlueSemiBold,
                                );
                              },
                            ),
                          ],
                        ),

                        verticalSpace(140),
                        BlocBuilder<OTPCubit, OtpStates>(
                            builder: (context, state) {
                              return state is VerifyOTPLoadingState
                              ? const CustomLoading()
                                  : CustomButton(
                                text: 'Verify',
                                elevation: 0.0,
                                radius: 10.r,
                                function: () {
                                    context.read<OTPCubit>().checkOTPAndVerify();
                                },
                              );
                            }
                        ),
                      ],
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}