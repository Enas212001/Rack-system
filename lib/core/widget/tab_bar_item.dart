import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TapBarItem extends StatelessWidget {
  const TapBarItem({
    super.key,
    required this.title,
    required this.index,
    required this.selected,
    required this.onIndexChanged,
  });
  final String title;
  final int index;
  final bool selected;
  final ValueChanged<int> onIndexChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onIndexChanged(index),
      child: Column(
        children: [
          Text(
            title,
            style: CustomTextStyles.text14W500Primary.copyWith(
              color: selected
                  ? AppColors.primaryColor
                  : AppColors.lightGreyColor,
            ),
          ),
          SizedBox(height: 4.h),
          Container(
            height: 2.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: selected ? AppColors.primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ],
      ),
    );
  }
}
