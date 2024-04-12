

import 'package:e_clinic/core/helpers/extensions.dart';
import 'package:e_clinic/core/helpers/spacing.dart';
import 'package:e_clinic/core/methods/navigation_method.dart';
import 'package:e_clinic/core/routing/routes.dart';
import 'package:e_clinic/core/theming/colors.dart';
import 'package:e_clinic/core/theming/font_weight_helper.dart';
import 'package:e_clinic/core/widgets/custom_button.dart';
import 'package:e_clinic/src/login/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';
import '../widgets/appointment_tap_bar_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.0.w, vertical: 30.h),
            child: Column(
              children: [

                // Container(
                //   height: 50.h,
                //   width: double.infinity,
                //   padding: EdgeInsets.all(6.w),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(6.r),
                //     color: AppColors.mainBlue.withOpacity(0.1),
                //   ),
                //
                //   child: Row(
                //     children: [
                //       Expanded(
                //           child: CustomButton(
                //               text: 'Upcoming',
                //               radius: 6,
                //               fontSize: 13,
                //               elevation: 0.0,
                //               function: (){})
                //       ),
                //       horizontalSpace(10.w),
                //       Expanded(
                //           child: CustomButton(
                //               text: 'Completed',
                //               radius: 6,
                //               fontSize: 13,
                //               color: AppColors.lightGray,
                //               elevation: 0.0,
                //               function: (){})
                //       ),
                //       horizontalSpace(10.w),
                //       Expanded(
                //           child: CustomButton(
                //               text: 'Cancelled',
                //               radius: 6,
                //               fontSize: 13,
                //               color: AppColors.lightGray,
                //               elevation: 0.0,
                //               function: (){})
                //       ),
                //     ],
                //   ),
                // ),
                //
                //
                // verticalSpace(20),
                Row(
                  children: [
                    AppointmentTapBarButton(
                      text: 'Upcoming',
                      selected: true,
                      function: (){

                      },
                    ),
                    AppointmentTapBarButton(
                      text: 'Completed',
                      selected: false,
                      function: (){

                      },
                    ),
                    AppointmentTapBarButton(
                      text: 'Canceled',
                      selected: false,
                      function: (){

                      },
                    ),
                  ],
                ),

                verticalSpace(40.h),
                Expanded(
                  child: ListView.separated(
                    itemCount: 5,
                  
                    itemBuilder: (context, state)=> Container(
                      width: double.infinity,
                      // padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: AppColors.lighterGray)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12.0.w),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '15/02/2001',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyles.font14GrayRegular,
                                    ),
                  
                                    Text(
                                      '05:30 AM',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyles.font14GrayRegular,
                                    ),
                                  ],
                                ),
                  
                                // verticalSpace(36),
                  
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.0.h),
                                  child: Text(
                                    'Dr.Mohamed Nasser',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyles.font16BlackSemiBold,
                                  ),
                                ),
                  
                              ],
                            ),
                          ),
                  
                  
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                    height: 42.h,
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadiusDirectional.only(
                                            bottomStart: Radius.circular(12.r)
                                        ),
                                        border: Border.all(color: AppColors.lighterGray)
                                    ),
                                    child: Text(
                                      'Cancel',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyles.font14GrayRegular,
                                    ),
                                  )
                              ),
                              Expanded(
                                  child: Container(
                                    height: 42.h,
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadiusDirectional.only(
                                            bottomEnd: Radius.circular(12.r)
                                        ),
                                        border: Border.all(color: AppColors.lighterGray)
                                    ),
                                    child: Text(
                                      'Update',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyles.font14GrayRegular,
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                      separatorBuilder: (context, state)=> verticalSpace(20),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.mainBlue,
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.schedule_rounded), label: 'Appointments'),
          BottomNavigationBarItem(icon: Icon(Icons.mark_unread_chat_alt_outlined), label: 'Chat'),
        ],
      ),
    );
  }
}
