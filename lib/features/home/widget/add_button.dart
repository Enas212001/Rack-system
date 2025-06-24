import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.textButton, this.onTap});
  final String textButton;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          margin: EdgeInsets.only(right: 18.w),
          decoration: BoxDecoration(
            color: AppColors.darkBlueColor,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Text(
            textButton,
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: AppColors.whiteColor),
          ),
        ),
      ),
    );
  }
}
