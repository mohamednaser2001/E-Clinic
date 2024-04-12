
import 'package:e_clinic/core/dependency_injection/dependency_injection.dart';
import 'package:e_clinic/core/helpers/extensions.dart';
import 'package:e_clinic/core/methods/navigation_method.dart';
import 'package:e_clinic/core/routing/routes.dart';
import 'package:e_clinic/core/theming/font_weight_helper.dart';
import 'package:e_clinic/core/widgets/custom_loading.dart';
import 'package:e_clinic/core/widgets/custom_text_button.dart';
import 'package:e_clinic/core/widgets/snack_bar.dart';
import 'package:e_clinic/src/home/ui/screens/home_screen.dart';
import 'package:e_clinic/src/login/logic/login_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: context.read<LoginCubit>().formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 30.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back',
                    style: AppStyles.font24BlueBold,
                  ),
                  verticalSpace(8),
                  Text(
                    'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                    style: AppStyles.font14GrayRegular,
                  ),
                  verticalSpace(36),

                  CustomTextFormField(
                    controller: context.read<LoginCubit>().emailController,
                    hint: 'Email',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your email';
                      } else {
                        return null;
                      }
                    },
                    context: context,
                  ),

                  verticalSpace(20),

                  CustomTextFormField(
                    controller: context.read<LoginCubit>().passwordController,
                    hint: 'Password',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your password';
                      } else {
                        return null;
                      }
                    },
                    context: context,
                  ),

                  verticalSpace(10),



                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: CustomTextButton(
                      text: 'Forgot Password?',
                      onPressed: (){


                      },
                    ),
                  ),

                  verticalSpace(50),

                  BlocBuilder<LoginCubit, LoginStates>(
                    builder: (context, state) {
                      return state is LoginLoadingState
                      ? const CustomLoading()
                      : CustomButton(
                        text: 'Login',
                        radius: 8.r,
                        height: 40.h,
                        function: () {
                          context.read<LoginCubit>().validateInputsAndLogin();
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
                            text: 'Don\'t have an account? ',
                            style: AppStyles.font13DarkBlueRegular,
                          ),
                          TextSpan(
                            text: 'Sign Up',
                            style: AppStyles.font13BlueSemiBold,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                              context.pushNamed(Routes.signupRoute);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),



                  /// Listen for screen states.
                  BlocListener<LoginCubit, LoginStates>(
                    listenWhen: (previous, current) => current is LoginErrorState || current is LoginSuccessState,
                    listener: (context, state) {
                      if(state is LoginErrorState){
                        CustomSnackBarHandler.showCustomSnackBar(
                            context: context, state: SnackBarStates.error,
                          text: state.error
                        );
                      }else if(state is LoginSuccessState){
                        CustomSnackBarHandler.showCustomSnackBar(
                            context: context, state: SnackBarStates.success, text: 'Welcome back,');
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