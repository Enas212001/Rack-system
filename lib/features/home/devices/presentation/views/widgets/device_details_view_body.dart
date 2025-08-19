import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/widget/item_detail.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeviceDetailsViewBody extends StatelessWidget {
  const DeviceDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyColor, width: 1.r),
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(11.r),
        ),
        padding: EdgeInsets.all(16.r),
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
            ItemDetail(label: 'Switch', value: 'bracelo switch'),
            ItemDetail(label: 'Port Number', value: '2'),
            ItemDetail(label: 'Device Name', value: '2'),
            ItemDetail(label: 'Device Serial', value: '2'),
            ItemDetail(label: 'MAC Address', value: '1'),
            ItemDetail(label: 'IP Address', value: '2'),
            ItemDetail(label: 'Patch Panel', value: '2'),
            ItemDetail(label: 'Device Model', value: '2'),
          ],
        ),
      ),
    );
  }
}
