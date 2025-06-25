import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RackItem extends StatelessWidget {
  const RackItem({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 86.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkBlueColor, width: 2.w),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(7.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rack',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.darkBlueColor,
                  ),
                ),
                Text(
                  id,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: AppColors.darkBlueColor,
                  ),
                ),
              ],
            ),
          ),
          Container(color: AppColors.darkBlueColor, height: 5.h),
        ],
      ),
    );
  }
}
