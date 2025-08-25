import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/widget/add_form_widget.dart';
import 'package:flutter_application_1/core/utils/widget/item_detail.dart';
import 'package:flutter_application_1/features/home/devices/data/models/device_model/device_item.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeviceDetailsViewBody extends StatelessWidget {
  const DeviceDetailsViewBody({super.key, required this.deviceItem});

  final DeviceItem deviceItem;

  @override
  Widget build(BuildContext context) {
    return AddFormWidget(
      isDeviceDetails: true,
      title: 'Device Details',
      childWidget: Padding(
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
            ItemDetail(label: 'Switch', value: deviceItem.switchId.toString()),
            ItemDetail(
              label: 'Port Number',
              value: deviceItem.portNumber.toString(),
            ),
            ItemDetail(
              label: 'Device Name',
              value: deviceItem.deviceName ?? '',
            ),
            ItemDetail(
              label: 'Device Serial',
              value: deviceItem.deviceSerial ?? '',
            ),
            ItemDetail(
              label: 'MAC Address',
              value: deviceItem.macAddress ?? '',
            ),
            ItemDetail(label: 'IP Address', value: deviceItem.ipAddress ?? ''),
            ItemDetail(
              label: 'Patch Panel',
              value: deviceItem.patchPanel ?? '',
            ),
            ItemDetail(label: 'Device Model', value: deviceItem.deviceModel),
          ],
        ),
      ),
    );
  }
}
