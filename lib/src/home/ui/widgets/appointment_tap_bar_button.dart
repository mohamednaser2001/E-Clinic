import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class AppointmentTapBarButton extends StatelessWidget {
  AppointmentTapBarButton(
      {Key? key,
      required this.function,
      required this.text,
      required this.selected})
      : super(key: key);
  Function() function;
  String text;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: function,
        child: Column(
          children: [
            Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.font18BlueMedium
                  .copyWith(color: selected ? AppColors.mainBlue : AppColors.lightGray),
            ),
            verticalSpace(10),
            Divider(
              color: selected ? AppColors.mainBlue : AppColors.lightGray,
              height: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
