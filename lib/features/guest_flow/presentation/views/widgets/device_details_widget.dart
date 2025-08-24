import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/widget/item_detail.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DeviceDatailsWidget extends StatelessWidget {
  const DeviceDatailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(16.h),
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.borderColor, width: 1.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 15,
                  offset: const Offset(1, 1),
                ),
              ],
              color: AppColors.scaffoldBackgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Device Details',
                  style: CustomTextStyles.text16MeduimText.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: 16.h),
                ItemDetail(label: 'Port :', value: '100'),
                ItemDetail(label: 'Serial :', value: '100'),
                ItemDetail(label: 'MAC :', value: '100'),
                ItemDetail(label: 'IP :', value: '100'),
                ItemDetail(label: 'Patch Panel :', value: '100'),
                ItemDetail(label: 'Product Number :', value: '100'),
                ItemDetail(label: 'Model :', value: '100'),
                ItemDetail(label: 'Device Serial :', value: '100'),
              ],
            ),
          ),
          Positioned(
            right: 18.w,
            top: 16.h,
            child: SvgPicture.asset(Assets.imagesGuestShape),
          ),
        ],
      ),
    );
  }
}
