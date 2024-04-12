
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/color_manger.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';




class ResetPasswordScreen extends StatelessWidget {

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: SingleChildScrollView(
            child: Stack(
              children: [

                Column(
                  children: [

                    SizedBox(height: 20.h,),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        'نسيت كلمة السر؟',
                        style: TextStyle(
                          fontSize: 30.sp,
                          height: 1.2,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      'من فضلك أدخل البريد الالكتروني الخاص بك أو رقم الهاتف لاعادة تعيين كلمة المرور.',
                      style: TextStyle(
                        fontSize: 16.sp,
                        height: 1.1,
                        color: AppColors.descriptionColor,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 24.h,),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'كلمة المرور',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    height: 1.1,
                                    color: AppColors.descriptionColor,
                                  ),
                                ),
                                CustomTextFormField(
                                  controller: passwordController,
                                  withBorder: false,
                                  inputType: TextInputType.emailAddress,
                                  color: Colors.white,
                                  validator: (value){},
                                  context: context,
                                ),
                                Container(height: 1.h,color: Colors.grey,),

                                SizedBox(height: 22.h,),
                                Text(
                                  'تأكيد كلمة المرور',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    height: 1.1,
                                    color: AppColors.descriptionColor,
                                  ),
                                ),
                                CustomTextFormField(
                                  controller: confirmPasswordController,
                                  withBorder: false,
                                  inputType: TextInputType.emailAddress,
                                  color: Colors.white,
                                  validator: (value){},
                                  context: context,
                                ),
                              ],
                            ),
                          ),
                          Container(height: 1.h,color: Colors.grey,),
                          SizedBox(height: 20.h,),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: CustomTextButton(
                              text: 'اعادة تعيين كلمة المرور',
                              textColor: Colors.black.withOpacity(0.8),
                              fontSize: 16.sp,
                              onPressed: (){},
                            ),
                          ),

                          SizedBox(height: 10.h,),

                        ],
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.25.h,
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





