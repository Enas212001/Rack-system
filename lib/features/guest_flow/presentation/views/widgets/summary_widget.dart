import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/container_decoration.dart';
import 'package:flutter_application_1/core/utils/widget/item_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'text_primary_16.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.h),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: containerDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text16MeduimPrimaryColor(text: 'Summary'),
            SizedBox(height: 16.h),
            ItemDetail(label: 'AP Room :', value: '0'),
            ItemDetail(label: 'AP out :', value: '0'),
            ItemDetail(label: 'CCTV in :', value: '0'),
            ItemDetail(label: 'CCTV out :', value: '0'),
          ],
        ),
      ),
    );
  }
}
