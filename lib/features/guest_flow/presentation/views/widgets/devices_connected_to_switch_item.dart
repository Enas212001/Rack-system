import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/expand_info_card.dart';
import 'package:flutter_application_1/core/utils/widget/item_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DevicesConnectedToSwitchItem extends StatelessWidget {
  const DevicesConnectedToSwitchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: ExpandableInfoCard(
        title: 'Device Name',
        details: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItemDetail(label: 'Serial Number', value: '10'),
              ItemDetail(label: 'MAC Address', value: '10'),
              ItemDetail(label: 'Site Name', value: '10'),
              ItemDetail(label: 'Model', value: '10'),
              ItemDetail(label: 'Switch Port', value: '10'),
              ItemDetail(label: 'Patch Panel Port', value: '10'),
            ],
          ),
        ),
      ),
    );
  }
}
