import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(fontSize: 8.sp, color: Colors.black),
      displaySmall: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
      titleLarge: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.w800),
      headlineMedium: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w800),
    ),
  );
}

abstract class CustomTextStyles {
  static final text16Bold = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );

  static final text20Bold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static final text14Regular = TextStyle(fontSize: 14.sp);
}
