import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconTextWithBG extends StatelessWidget {
  const IconTextWithBG({super.key, this.icon, required this.text, this.onTap});
  final IconData? icon;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryColor),
          SizedBox(width: 4.w),
          Text(
            text,
            style: CustomTextStyles.text12RegularGrey.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
