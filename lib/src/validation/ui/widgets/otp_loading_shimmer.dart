import 'package:e_clinic/core/helpers/spacing.dart';
import 'package:e_clinic/core/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class OTPLoadingShimmer extends StatelessWidget {
  const OTPLoadingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      // direction: ShimmerDirection.rtl,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 40.h,
          child: ListView.separated(
            shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  const CustomShimmer(height: 40, width: 40, radius: 6,),
              separatorBuilder: (context, index) => SizedBox(width: 20.w,),
              itemCount: 6),
        ),


        verticalSpace(12),
        const Align(
            alignment: AlignmentDirectional.centerEnd,
            child: CustomShimmer(height: 18, width: 70)),

        verticalSpace(140),
        const CustomShimmer(height: 52, width: double.infinity, radius: 10,)
      ]),
    );
  }
}
