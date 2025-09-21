import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widget/expand_info_card.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'building_details.dart';

class BuildingItem extends StatelessWidget {
  const BuildingItem({
    super.key,
    required this.building,
    required this.hotelId,
  });
  final BuildingModel building;
  final String hotelId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: ExpandableInfoCard(
        title: building.buildingName!,
        details: BuildingDetails(building: building, hotelId: hotelId),
      ),
    );
  }
}
