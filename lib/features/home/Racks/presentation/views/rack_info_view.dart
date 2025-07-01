import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/Buildings/models/building_model.dart';
import 'package:flutter_application_1/features/home/Hotels/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Racks/cubit/rack_cubit.dart';
import 'package:flutter_application_1/features/home/Racks/models/rack_info_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/rack_info_view_body.dart';

class RackInfoView extends StatelessWidget {
  const RackInfoView({
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
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            RackCubit()..getRacksInfo(buildingRId: buildingModel.buildingRId!),
        child: RackInfoViewBody(
          hotelModel: hotelModel,
          buildingModel: buildingModel,
          rackInfoModel: rackInfoModel,
        ),
      ),
    );
  }
}
