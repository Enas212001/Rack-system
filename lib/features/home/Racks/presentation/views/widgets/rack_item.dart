import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/widget/expand_info_card.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/rack_info_model.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/views/widgets/rack_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RackItem extends StatelessWidget {
  const RackItem({
    super.key,
    required this.rackInfoModel,
    required this.buildingModel,
  });
  final RackInfoModel rackInfoModel;
  final BuildingModel buildingModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: ExpandableInfoCard(
        title: rackInfoModel.id ?? '',
        details: RackDetails(
          rackInfoModel: rackInfoModel,
          buildingModel: buildingModel,
        ),
      ),
    );
  }
}
