import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/features/home/Buildings/models/building_model.dart';
import 'package:flutter_application_1/features/home/Hotels/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Racks/models/rack_info_model.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/views/widgets/rack_info_id.dart';
import 'package:flutter_application_1/features/home/widget/top_with_back.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'rack_info_builder.dart';

class RackInfoViewBody extends StatelessWidget {
  const RackInfoViewBody({
    super.key,
    required this.hotelModel,
    required this.buildingModel,
    required this.rackInfoModel,
  });
  final HotelModel hotelModel;
  final BuildingModel buildingModel;
  final RackInfoModel rackInfoModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopWithBack(text: 'Rack'),
        RacksInfoId(
          hotelName: hotelModel.name!,
          id: buildingModel.id!,
          rackId: rackInfoModel.id!,
        ),
        RackInfoBuilder(buildingId: buildingModel.buildingRId!),
        SizedBox(height: 20.h),
      ],
    );
  }
}
