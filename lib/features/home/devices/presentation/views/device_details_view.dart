import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/devices/data/models/device_model/device_item.dart';

import 'widgets/device_details_view_body.dart';

class DeviceDetailsView extends StatelessWidget {
  const DeviceDetailsView({super.key, required this.deviceItem});

  final DeviceItem deviceItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DeviceDetailsViewBody(deviceItem: deviceItem));
  }
}
