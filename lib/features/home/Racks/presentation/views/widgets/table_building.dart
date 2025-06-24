import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'table_item.dart';

class TableData extends StatelessWidget {
  const TableData({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: AppColors.blackColor),
      children: [
        TableRow(
          decoration: BoxDecoration(color: AppColors.primaryColor),
          children: [
            TableItem(
              text: 'Vlan Name',
              color: AppColors.primaryColor,
              height: 50.h,
            ),
            TableItem(
              text: 'Vlan ID',
              color: AppColors.primaryColor,
              height: 50.h,
            ),
            TableItem(
              text: 'Colour Code',
              color: AppColors.primaryColor,
              height: 50.h,
            ),
          ],
        ),
        TableRow(
          children: [
            TableItem(text: 'Camera', color: AppColors.backgroundColor),
            TableItem(text: '60'),
            TableItem(text: 'Turquoise'),
          ],
        ),
        TableRow(
          children: [
            TableItem(text: 'Admin', color: AppColors.backgroundColor),
            TableItem(text: '80'),
            TableItem(text: 'Green'),
          ],
        ),
      ],
    );
  }
}
