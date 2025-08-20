import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';

import 'device_guest_item_details.dart';
import 'guest_view_item.dart';

class DeviceGuetItem extends StatelessWidget {
  const DeviceGuetItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GuestViewItem(
      image: Assets.imagesDeviceGuest,
      title: 'Device Name',
      widget: DeviceGuestItemDetails(),
    );
  }
}
