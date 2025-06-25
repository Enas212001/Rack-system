import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'export_building_to_pdf.dart';

class BuildingInfo extends StatelessWidget {
  const BuildingInfo({super.key, required this.hotelName});
  final String hotelName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                hotelName[0].toUpperCase() +
                    hotelName.substring(1).toLowerCase(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                '/Buildings',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
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
