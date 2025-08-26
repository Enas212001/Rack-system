import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/widget/item_detail.dart';
import 'package:flutter_application_1/features/home/devices/data/models/device_model/device_item.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DeviceDatailsWidget extends StatelessWidget {
  const DeviceDatailsWidget({super.key, required this.deviceItem});
  final DeviceItem deviceItem;
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
                ItemDetail(
                  label: 'Port :',
                  value: deviceItem.portNumber!.toString(),
                ),
                ItemDetail(
                  label: 'Serial :',
                  value: deviceItem.deviceSerial ?? '',
                ),
                ItemDetail(label: 'MAC :', value: deviceItem.macAddress ?? ''),
                ItemDetail(label: 'IP :', value: deviceItem.ipAddress ?? ''),
                ItemDetail(
                  label: 'Patch Panel :',
                  value: deviceItem.patchPanel ?? '',
                ),
                ItemDetail(
                  label: 'Product Number :',
                  value: deviceItem.productNumber ?? '',
                ),
                ItemDetail(
                  label: 'Model :',
                  value: deviceItem.deviceModel ?? '',
                ),
                ItemDetail(
                  label: 'Device Serial :',
                  value: deviceItem.deviceSerial ?? '',
                ),
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
