import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/rack_info_model.dart';
import 'package:flutter_application_1/features/home/widget/expand_info_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'rack_details.dart';

class RockInfoListView extends StatelessWidget {
  const RockInfoListView({super.key, required this.rackInfoModel});
  final List<RackInfoModel> rackInfoModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: rackInfoModel.length,
        padding: EdgeInsets.all(12.r),
        separatorBuilder: (_, __) => SizedBox(height: 8.h),
        itemBuilder: (context, index) {
          final rack = rackInfoModel[index];
          return ExpandableInfoCard(
            image: Assets.imagesDevice,
            title: 'Device Name: ${rack.deviceName ?? 'N/A'}',
            details: RackDetails(rack: rack),
          );
        },
      ),
    );
  }
}
