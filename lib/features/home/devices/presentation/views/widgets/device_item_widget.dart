import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/widget/expand_info_card.dart';
import 'package:flutter_application_1/features/home/devices/data/models/device_model/device_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'device_details.dart';

class DeviceItemWidget extends StatelessWidget {
  const DeviceItemWidget({super.key, required this.deviceItem});
  final DeviceItem deviceItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(
              context,
            ).push(AppRoutes.deviceDetails, extra: deviceItem);
          },
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: ExpandableInfoCard(
              title: deviceItem.deviceName.toString(),
              details: DeviceDetails(deviceItem: deviceItem),
            ),
          ),
        ),
      ],
    );
  }
}
