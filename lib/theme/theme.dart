import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getThemeData() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
      titleLarge: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w800),
      titleMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.w800),
      headlineMedium: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w800),
    ),
  );
}
