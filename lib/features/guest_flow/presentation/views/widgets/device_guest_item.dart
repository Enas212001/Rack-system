import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/features/home/devices/data/models/device_model/device_item.dart';

import 'device_guest_item_details.dart';
import 'guest_view_item.dart';

class DeviceGuetItem extends StatelessWidget {
  const DeviceGuetItem({super.key, required this.deviceItem});
  final DeviceItem deviceItem;

  @override
  Widget build(BuildContext context) {
    return GuestViewItem(
      image: Assets.imagesDeviceGuest,
      title: deviceItem.deviceName ?? '',
      widget: DeviceGuestItemDetails(deviceItem: deviceItem),
    );
  }
}
