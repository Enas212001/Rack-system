import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'icon_with_title.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(0, 8), // shadow below
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(Assets.imagesPowerSMTPLogo, width: 52.w, height: 52.h),
          Container(
            height: 46.h,
            width: 1.5.w,
            color: AppColors.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 6.w),
          ),
          IconWithTitle(image: Assets.imagesClients, title: 'Our Clients'),
          IconWithTitle(title: 'Buildings', image: Assets.imagesBuildings),
          IconWithTitle(
            title: 'Settings',
            image: Assets.imagesSettings,
            color: AppColors.blackColor,
          ),
          IconWithTitle(
            title: 'Help Center',
            image: Assets.imagesHelpCenter,
            color: AppColors.blackColor,
          ),
        ],
      ),
    );
  }
}
