import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widget/expand_info_card.dart';
import 'package:flutter_application_1/core/widget/item_detail.dart';
import 'package:flutter_application_1/features/home/devices/data/models/device_model/device_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DevicesConnectedToSwitchItem extends StatelessWidget {
  const DevicesConnectedToSwitchItem({super.key, required this.deviceItem});
  final DeviceItem deviceItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: ExpandableInfoCard(
        title: deviceItem.deviceName!,
        details: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItemDetail(
                label: 'Serial Number',
                value: deviceItem.deviceSerial!,
              ),
              ItemDetail(label: 'MAC Address', value: deviceItem.macAddress!),
              ItemDetail(label: 'IP Address', value: deviceItem.ipAddress!),
              ItemDetail(label: 'Model', value: deviceItem.deviceModel!),
            ],
          ),
        ),
      ),
    );
  }
}
