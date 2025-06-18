import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'table_item.dart';

class RockInfoTable extends StatelessWidget {
  const RockInfoTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        border: TableBorder.all(color: AppColors.blackColor),
        defaultColumnWidth: IntrinsicColumnWidth(),
        children: [
          TableRow(
            children: [
              TableItem(
                text: 'DEVICE NAME',
                width: 100.w,
                height: 60.h,
                color: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
              ),
              TableItem(
                text: 'SERIAL NUMBER',
                height: 60.h,
                color: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
              ),
              TableItem(
                text: 'MAC ADDRESS',
                height: 60.h,
                color: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
              ),
              TableItem(
                text: 'MODEL',
                height: 60.h,
                color: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
              ),
              TableItem(
                text: 'SITE NAME',
                height: 60.h,
                color: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
              ),
              TableItem(
                text: 'Switch Port',
                width: 100.w,
                height: 60.h,
                color: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
              ),
              TableItem(
                text: 'Patch Panel Port',
                width: 120.w,
                height: 60.h,
                color: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
              ),
            ],
          ),
          TableRow(
            children: [
              TableItem(text: '101'),
              TableItem(text: 'SN123456'),
              TableItem(text: '00:1A:2B:3C:4D:5E'),
              TableItem(text: 'GWN7664'),
              TableItem(text: 'Building 100'),
              TableItem(text: '1'),
              TableItem(text: '2'),
            ],
          ),
          TableRow(
            children: [
              TableItem(text: '101'),
              TableItem(text: 'SN123456'),
              TableItem(text: '00:1A:2B:3C:4D:5E'),
              TableItem(text: 'GWN7664'),
              TableItem(text: 'Building 100'),
              TableItem(text: '1'),
              TableItem(text: '2'),
            ],
          ),
          TableRow(
            children: [
              TableItem(text: '101'),
              TableItem(text: 'SN123456'),
              TableItem(text: '00:1A:2B:3C:4D:5E'),
              TableItem(text: 'GWN7664'),
              TableItem(text: 'Building 100'),
              TableItem(text: '1'),
              TableItem(text: '2'),
            ],
          ),
        ],
      ),
    );
  }
}
