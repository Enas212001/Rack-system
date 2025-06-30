import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddFullSizeButton extends StatelessWidget {
  const AddFullSizeButton({super.key, required this.text, this.onPressed});

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.r),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.sizeOf(context).width, 48.h),
          backgroundColor: AppColors.primaryColor,
        ),
        child: Text(text, style: CustomTextStyles.text16Bold),
      ),
    );
  }
}
