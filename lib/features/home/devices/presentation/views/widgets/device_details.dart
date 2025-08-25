import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/widget/item_detail.dart';
import 'package:flutter_application_1/features/home/devices/data/models/device_model/device_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DeviceDetails extends StatelessWidget {
  const DeviceDetails({super.key, required this.deviceItem});
  final DeviceItem deviceItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemDetail(label: 'Serial', value: deviceItem.deviceSerial),
          ItemDetail(label: 'MAC', value: deviceItem.macAddress),
          ItemDetail(label: 'IP', value: deviceItem.ipAddress),
          ItemDetail(label: 'Patch Panel', value: deviceItem.patchPanel),
          ItemDetail(label: 'Product Number', value: deviceItem.productNumber),
          ItemDetail(label: 'Model', value: deviceItem.deviceModel),
          ItemDetail(
            label: 'Actions',
            isAction: true,
            onEdit: () {
              GoRouter.of(context).push(AppRoutes.editDevice);
            },
          ),
        ],
      ),
    );
  }
}
