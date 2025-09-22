import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/widget/item_detail.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SwitchDetails extends StatelessWidget {
  const SwitchDetails({super.key, required this.switchItem});
  final SwitchItem switchItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemDetail(label: 'Serial', value: switchItem.serialNumber),
          ItemDetail(label: 'MAC', value: switchItem.macAdd),
          ItemDetail(label: 'IP', value: switchItem.ipAdd),
          ItemDetail(
            label: 'Portal Number',
            value: switchItem.portNumber.toString(),
          ),
          ItemDetail(label: 'Model', value: switchItem.model),
          ItemDetail(
            label: 'Actions',
            isAction: true,
            isSwitch: true,
            showReport: () {
              context.push(AppRoutes.report, extra: switchItem);
            },
          ),
        ],
      ),
    );
  }
}
