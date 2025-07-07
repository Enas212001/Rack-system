import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Hotels/data/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/cubit/rack_cubit.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/rack_info_model.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/views/widgets/rack_info_id.dart';
import 'package:flutter_application_1/features/home/widget/top_with_back.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final rackCubit = context.read<RackCubit>();
    return Column(
      children: [
        TopWithBack(
          text: 'Rack',
          title: 'Rack',
          onSearchChanged: rackCubit.searchRack,
        ),
        RacksInfoId(
          hotelName: hotelModel.name!,
          id: buildingModel.id!,
          rackId: rackInfoModel.id!,
        ),
        RackInfoBuilder(),
        SizedBox(height: 20.h),
      ],
    );
  }
}
