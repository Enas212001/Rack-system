import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/item_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RackGuestItemDetails extends StatelessWidget {
  const RackGuestItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        ItemDetail(label: 'Size :', value: '100'),
        ItemDetail(label: 'Model :', value: '100'),
        ItemDetail(label: 'Building :', value: '100'),
      ],
    );
  }
}
