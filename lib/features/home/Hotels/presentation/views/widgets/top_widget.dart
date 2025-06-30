import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({super.key, this.widget, this.isAdd});
  final Widget? widget;
  final bool? isAdd;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isAdd == true ? 141.h : 101.h,
      alignment: isAdd == true ? Alignment.center : Alignment.bottomCenter,
      padding:
          EdgeInsets.only(bottom: 12.h, top: isAdd == true ? 16.h : 0) +
          EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.r),
          bottomRight: Radius.circular(8.r),
        ),
      ),
      child: widget,
    );
  }
}
