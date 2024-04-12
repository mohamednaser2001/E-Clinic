
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theming/styles.dart';
import '../utils/color_manger.dart';




class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fontSize=16,
    this.textColor=AppColors.mainBlue,
    this.icon=null ,

  }) : super(key: key);

  String text;
  Function onPressed;
  double fontSize=16;
  Color textColor=AppColors.mainBlue;
  Widget? icon=null ;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(foregroundColor : MaterialStateProperty.all<Color>(textColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if(icon!=null)
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 4.0),
              child: icon!,
            ),
          Text(
            text,
            style: AppStyles.font13BlueRegular
          ),
        ],
      ),
      onPressed: (){
        onPressed();
      },
    );
  }
}
