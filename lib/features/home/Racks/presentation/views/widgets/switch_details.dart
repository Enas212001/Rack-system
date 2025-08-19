import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/item_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchDetails extends StatelessWidget {
  const SwitchDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemDetail(label: 'Serial', value: '101'),
          ItemDetail(label: 'MAC', value: '1'),
          ItemDetail(label: 'IP', value: '2'),
          ItemDetail(label: 'Portal Number', value: '2'),
          ItemDetail(label: 'Model', value: '2'),
          ItemDetail(label: 'Actions', isAction: true, isSwitch: true),
        ],
      ),
    );
  }
}
