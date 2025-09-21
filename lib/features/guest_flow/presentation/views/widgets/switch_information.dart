import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widget/item_detail.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'card_details.dart';
import 'text_primary_16.dart';

class SwitchInformation extends StatelessWidget {
  const SwitchInformation({super.key, required this.switchItem});
  final SwitchItem switchItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: DetailCard(
        topCard: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text16MeduimPrimaryColor(text: 'Switch information'),
            SizedBox(height: 16.h),
            ItemDetail(label: 'Device Name :', value: switchItem.name!),
            ItemDetail(label: 'Serial :', value: switchItem.serialNumber!),
          ],
        ),
        bottomCard: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemDetail(label: 'MAC :', value: switchItem.macAdd!),
            ItemDetail(label: 'Model :', value: switchItem.model!),
            ItemDetail(
              label: 'Switch Port :',
              value: switchItem.portNumber!.toString(),
            ),
            // ItemDetail(label: 'Patch Panel Port :', value: switchItem.patchPanelPort!),
          ],
        ),
      ),
    );
  }
}
