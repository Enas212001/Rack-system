import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({
    super.key,
    required this.widget,
    this.isAdd,
    this.text,
    this.onSearchChanged,
    this.isRack,
  });
  final Widget widget;
  final bool? isAdd, isRack;
  final String? text;
  final ValueChanged<String>? onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isRack == true ? 100.h : 141.h,
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
      child: isAdd == true || isRack == true
          ? widget
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                widget,
                SizedBox(height: 12.h),
                SizedBox(
                  height: 35.h,
                  child: TextField(
                    onChanged: onSearchChanged,
                    decoration: InputDecoration(
                      hintText: 'Search for any $text',
                      hintStyle: CustomTextStyles.text12RegularGrey,
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.greyColor,
                        size: 14.sp,
                      ),
                      filled: true,
                      fillColor: AppColors.whiteColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
