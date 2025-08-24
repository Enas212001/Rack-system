import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/item_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'device_details_widget.dart';

class DeviceGuestItemDetails extends StatelessWidget {
  const DeviceGuestItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        ItemDetail(label: 'Port :', value: '100'),
        ItemDetail(label: 'Serial :', value: '100'),
        ItemDetail(label: 'MAC :', value: '100'),
        ItemDetail(label: 'IP :', value: '100'),
        ItemDetail(label: 'Patch Panel :', value: '100'),
        ItemDetail(label: 'Product Number :', value: '100'),
        ItemDetail(label: 'Model :', value: '100'),
        ItemDetail(
          label: 'Action :',
          isAction: true,
          isDevice: true,
          showDetails: () {
            showDialog(
              context: context,
              builder: (context) => DeviceDatailsWidget(),
            );
          },
        ),
      ],
    );
  }
}
