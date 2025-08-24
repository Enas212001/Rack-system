import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/item_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'card_details.dart';
import 'text_primary_16.dart';

class SwitchInformation extends StatelessWidget {
  const SwitchInformation({super.key});

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
            ItemDetail(label: 'Device Name :', value: 'Barcelo'),
            ItemDetail(label: 'Serial :', value: '100'),
          ],
        ),
        bottomCard: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemDetail(label: 'MAC :', value: '1'),
            ItemDetail(label: 'Site name :', value: '100'),
            ItemDetail(label: 'Model :', value: '100'),
            ItemDetail(label: 'Switch Port :', value: '100'),
            ItemDetail(label: 'Patch Panel Port :', value: '100'),
          ],
        ),
      ),
    );
  }
}
