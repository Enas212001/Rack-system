import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    primaryColor: AppColors.primaryColor,
    fontFamily: 'Inter',
  );
}

abstract class CustomTextStyles {
  static final text14W600Text = TextStyle(
    color: AppColors.textColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );

  static final text20Bold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static final text14Regular = TextStyle(fontSize: 14.sp);
  static final text14W500Primary = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );
  static final text13Regular = TextStyle(fontSize: 13.sp);
  static final text12RegularGrey = TextStyle(
    fontSize: 12.sp,
    color: AppColors.greyColor,
  );
  static final text12W500Text = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );
  static final text11RegularGrey = TextStyle(
    fontSize: 11.sp,
    color: AppColors.greyColor,
  );
}
