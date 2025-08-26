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
    this.withoutSearch,
    this.isText,
    this.withDrawer = false,
  });

  final Widget widget;
  final bool? isAdd, withoutSearch, isText, withDrawer;
  final String? text;
  final ValueChanged<String>? onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: withoutSearch == true ? 100.h : 141.h,
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
      child: isAdd == true
          ? widget
          : withoutSearch == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                withDrawer == true
                    ? IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.scaffoldBackgroundColor,
                          size: 16.sp,
                        ),
                      )
                    : IconButton(
                        icon: Icon(Icons.menu, color: AppColors.whiteColor),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                widget,
                SizedBox(width: 36.w),
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu, color: AppColors.whiteColor),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                    widget,
                    SizedBox(width: isText == true ? 36.w : 16.w),
                  ],
                ),
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
