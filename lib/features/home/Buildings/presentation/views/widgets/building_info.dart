import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'export_building_to_pdf.dart';

class BuildingInfo extends StatelessWidget {
  const BuildingInfo({super.key, required this.hotelName});
  final String hotelName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                hotelName[0].toUpperCase() +
                    hotelName.substring(1).toLowerCase(),
                style: CustomTextStyles.text14Regular.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              Spacer(),
              ExportBuildingToPDF(hotelName: hotelName),
            ],
          ),
        ],
      ),
    );
  }
}
