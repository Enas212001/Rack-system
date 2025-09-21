import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LostConnection extends StatelessWidget {
  const LostConnection({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(Assets.imagesConnectivity, height: 195.h, width: 195.w),
          SizedBox(height: 24.h),
          Text(
            'Error in Network Connection !!',
            style: CustomTextStyles.text14W600Text,
          ),
          Text(
            'Please check your internet connection and try again !!',
            style: CustomTextStyles.text12RegularGrey,
          ),
        ],
      ),
    );
  }
}
