import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

BoxDecoration containerDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(8.r),
    border: Border.all(color: AppColors.borderColor, width: 1.r),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.1),
        blurRadius: 15,
        offset: const Offset(1, 1),
      ),
    ],
    color: AppColors.scaffoldBackgroundColor,
  );
}
