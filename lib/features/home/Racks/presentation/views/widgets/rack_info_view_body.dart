import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/features/home/Buildings/models/building_model.dart';
import 'package:flutter_application_1/features/home/Hotels/models/hotel_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widget/common_widget.dart';
import 'rack_info.dart';
import 'rack_info_builder.dart';

class RackInfoViewBody extends StatelessWidget {
  const RackInfoViewBody({
    super.key,
    required this.hotelModel,
    required this.buildingModel,
  });
  final HotelModel hotelModel;
  final BuildingModel buildingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonWidget(popUp: true),
        SizedBox(height: 50.h),
        RacksInfo(hotelName: hotelModel.name!, id: hotelModel.id!, rackId: buildingModel.id!),
        SizedBox(height: 20.h),
        Image.network(
          '${Endpoints.baseUrlImage}/${hotelModel.logo!.trim()}',
          height: 80.h,
        ),
        SizedBox(height: 10.h),
        RackInfoBuilder(buildingId: buildingModel.buildingRId!),
        SizedBox(height: 20.h),
        // BackAndNextButton(),
      ],
    );
  }
}
