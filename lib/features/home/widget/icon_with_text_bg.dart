import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconTextWithBG extends StatelessWidget {
  const IconTextWithBG({super.key, this.icon, required this.text});
  final IconData? icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(color: AppColors.backgroundColor),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 4.w),
          Text(text, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
