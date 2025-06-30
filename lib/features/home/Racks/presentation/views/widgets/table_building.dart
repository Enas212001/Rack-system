import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'table_item.dart';

class TableData extends StatelessWidget {
  const TableData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Table(
        border: TableBorder.all(color: AppColors.borderColor),
        children: [
          TableRow(
            children: [
              TableHeadItem(text: 'Vlan Name', height: 50.h),
              TableHeadItem(text: 'Vlan ID', height: 50.h),
              TableHeadItem(text: 'Colour Code', height: 50.h),
            ],
          ),
          TableRow(
            children: [
              TableItem(text: 'Camera'),
              TableItem(text: '60'),
              TableItem(text: 'Turquoise'),
            ],
          ),
          TableRow(
            children: [
              TableItem(text: 'Admin'),
              TableItem(text: '80'),
              TableItem(text: 'Green'),
            ],
          ),
        ],
      ),
    );
  }
}
