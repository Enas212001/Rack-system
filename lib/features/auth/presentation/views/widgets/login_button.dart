import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(50.r),
        ),
        padding: EdgeInsets.all(11.r),
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        alignment: Alignment.center,
        child: Text(
          'Login',
          style: CustomTextStyles.text14Regular.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
