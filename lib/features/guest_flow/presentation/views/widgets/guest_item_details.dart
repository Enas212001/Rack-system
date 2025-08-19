import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/item_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuestViewItemDetails extends StatelessWidget {
  const GuestViewItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        ItemDetail(label: 'Hotel Id :', value: '100'),
        ItemDetail(label: 'Rack Id :', value: '100'),
        ItemDetail(label: 'Building Rack Id :', value: '100'),
      ],
    );
  }
}
