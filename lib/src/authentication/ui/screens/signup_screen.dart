
import 'package:e_clinic/core/dependency_injection/dependency_injection.dart';
import 'package:e_clinic/core/helpers/app_regex.dart';
import 'package:e_clinic/core/helpers/extensions.dart';
import 'package:e_clinic/core/helpers/spacing.dart';
import 'package:e_clinic/core/routing/routes.dart';
import 'package:e_clinic/core/theming/styles.dart';
import 'package:e_clinic/src/authentication/view_model/signup_cubit/signup_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/snack_bar.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: context.read<SignupCubit>().formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 30.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create Account',
                    style: AppStyles.font24BlueBold,
                  ),
                  verticalSpace(8),
                  Text(
                    'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                    style: AppStyles.font14GrayRegular,
                  ),
                  verticalSpace(36),

                  CustomTextFormField(
                    controller: context.read<SignupCubit>().nameController,
                    hint: 'Name',
                    validator: (value) {
                      if (value==null || value.isEmpty) {
                        return 'Enter your name';
                      } else {
                        return null;
                      }
                    },
                    context: context,
                  ),

                  verticalSpace(20),

                  CustomTextFormField(
                    controller: context.read<SignupCubit>().emailController,
                    hint: 'Email',
                    validator: (value) {
                      if (value==null || value.isEmpty || !AppRegex.isEmailValid(value.trim())) {
                        return 'Enter your email';
                      } else {
                        return null;
                      }
                    },
                    context: context,
                  ),

                  verticalSpace(20),

                  CustomTextFormField(
                    controller: context.read<SignupCubit>().phoneController,
                    hint: 'Phone',
                    validator: (value) {
                      if (value==null || value.isEmpty || !AppRegex.isPhoneNumberValid(value.trim())) {
                        return 'Enter your phone';
                      } else {
                        return null;
                      }
                    },
                    context: context,
                  ),

                  verticalSpace(20),

                  CustomTextFormField(
                    controller: context.read<SignupCubit>().passwordController,
                    hint: 'Password',
                    validator: (value) {
                      if (value==null || value.isEmpty) {
                        return 'Enter your password';
                      } else if(value.trim().length<6){
                        return 'Password must be at least 6 characters';
                      }else {
                        return null;
                      }
                    },
                    context: context,
                  ),

                  verticalSpace(20),

                  GestureDetector(
                    onTap: ()async {
                      DateTime? date= await showDatePicker(
                          context: context,
                          firstDate: DateTime.utc(1940,1,1),
                          lastDate: DateTime.now(),
                      );
                      context.read<SignupCubit>().birthDateController.text= date.toString().substring(0, 10);
                    },
                    child: CustomTextFormField(
                      controller: context.read<SignupCubit>().birthDateController,
                      hint: 'Tap to select birth date',
                      icon: Icons.date_range,
                      isEnabled: false,
                      validator: (value) {
                        if (value==null || value.isEmpty) {
                          return 'Enter your birth date';
                        } else {
                          return null;
                        }
                      },
                      context: context,
                    ),
                  ),

                  verticalSpace(20),
                  Text(
                    'Gender',
                    style: AppStyles.font16BlackSemiBold,
                  ),
                  BlocConsumer<SignupCubit, SignupStates>(
                    listener: (context, state){},
                      builder: (context, state) {
                        return  Row(
                        children: [
                          Radio(
                              value: context.read<SignupCubit>().genders[0],
                              groupValue: context.read<SignupCubit>().gender,
                              onChanged: (value){
                                context.read<SignupCubit>().changeGender(value);
                              },
                          ),
                          Text(
                            'Male',
                            style: AppStyles.font14GrayRegular,
                          ),

                          const Spacer(),

                          Radio(
                              value: context.read<SignupCubit>().genders[1],
                              groupValue: context.read<SignupCubit>().gender,
                              onChanged: (value){
                                context.read<SignupCubit>().changeGender(value);
                              }
                          ),
                          Text(
                            'Female',
                            style: AppStyles.font14GrayRegular,
                          ),
                        ],
                      );
                    }
                  ),

                  verticalSpace(40),

                  BlocBuilder<SignupCubit, SignupStates>(
                    builder: (context, state) {
                      return state is SignupLoadingState
                      ? const CustomLoading()
                      : CustomButton(
                        text: 'Create Account',
                        radius: 8.r,
                        height: 40.h,
                        function: () {
                          context.read<SignupCubit>().validateInputsAndSignup(context);
                        },
                      );
                    }
                  ),

                  verticalSpace(20),

                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already have an account?',
                            style: AppStyles.font13DarkBlueRegular,
                          ),
                          TextSpan(
                            text: 'Login',
                            style: AppStyles.font13BlueSemiBold,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pop();
                              },
                          ),
                        ],
                      ),
                    ),
                  ),



                  /// Listen for screen states.
                  BlocListener<SignupCubit, SignupStates>(
                    listenWhen: (previous, current) => current is SignupErrorState || current is SignupSuccessState,
                    listener: (context, state) {
                      if(state is SignupErrorState){
                        CustomSnackBarHandler.showCustomSnackBar(
                            context: context, state: SnackBarStates.error, text: state.error
                        );
                      }else if(state is SignupSuccessState){
                        CustomSnackBarHandler.showCustomSnackBar(
                            context: context, state: SnackBarStates.success,
                            text: 'Your account has been created successfully, \nPlease verify your account'
                        );
                        context.pushNamed(Routes.otpRoute, arguments: state.token);
                      }
                    },
                    child: const SizedBox.shrink(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}