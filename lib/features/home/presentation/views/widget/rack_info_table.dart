import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/features/home/data/models/rack_info_model/rack_info_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'table_item.dart';

class RockInfoTable extends StatelessWidget {
  const RockInfoTable({super.key, required this.rackInfoModel});
  final List<RackInfoModel> rackInfoModel;
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
          for (final rack in rackInfoModel)
            TableRow(
              children: [
                TableItem(text: rack.deviceName ?? ''),
                TableItem(text: rack.productSerial ?? ''),
                TableItem(text: rack.productMac ?? ''),
                TableItem(text: rack.productModel ?? ''),
                TableItem(text: rack.siteName ?? ''),
                TableItem(text: rack.productPort ?? ''),
                TableItem(text: rack.productPanal ?? ''),
              ],
            ),
          // ...rackInfoModel
          //     .map(
          //       (rack) => TableRow(
          //         children: [
          //           TableItem(text: rack.deviceName ?? ''),
          //           TableItem(text: rack.productSerial ?? ''),
          //           TableItem(text: rack.productMac ?? ''),
          //           TableItem(text: rack.productModel ?? ''),
          //           TableItem(text: rack.siteName ?? ''),
          //           TableItem(text: rack.productPort ?? ''),
          //           TableItem(text: rack.productPanal ?? ''),
          //         ],
          //       ),
          //     )
          //     .toList(),
        ],
      ),
    );
  }
}
