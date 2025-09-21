import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widget/item_detail.dart';
import 'package:flutter_application_1/features/home/devices/data/models/device_model/device_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'device_details_widget.dart';

class DeviceGuestItemDetails extends StatelessWidget {
  const DeviceGuestItemDetails({super.key, required this.deviceItem});
  final DeviceItem deviceItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        ItemDetail(label: 'Port :', value: deviceItem.portNumber!.toString()),
        ItemDetail(label: 'Serial :', value: deviceItem.deviceSerial ?? ''),
        ItemDetail(label: 'MAC :', value: deviceItem.macAddress ?? ''),
        ItemDetail(label: 'IP :', value: deviceItem.ipAddress ?? ''),
        ItemDetail(label: 'Patch Panel :', value: deviceItem.patchPanel ?? ''),
        ItemDetail(
          label: 'Product Number :',
          value: deviceItem.productNumber ?? '',
        ),
        ItemDetail(label: 'Model :', value: deviceItem.deviceModel ?? ''),
        ItemDetail(
          label: 'Action :',
          isAction: true,
          isDevice: true,
          showDetails: () {
            showDialog(
              context: context,
              builder: (context) => DeviceDatailsWidget(deviceItem: deviceItem),
            );
          },
        ),
      ],
    );
  }
}
