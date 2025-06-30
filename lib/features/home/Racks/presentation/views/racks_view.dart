import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/Buildings/models/building_model.dart';
import 'package:flutter_application_1/features/home/Hotels/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Racks/cubit/rack_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/rack_view_body.dart';

class RacksView extends StatelessWidget {
  const RacksView({
    super.key,
    required this.hotelModel,
    required this.buildingModel,
  });
  final HotelModel hotelModel;
  final BuildingModel buildingModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            RackCubit()
              ..getRacksInfo(buildingRId: buildingModel.buildingRId!),
        child: RackViewBody(
          hotelModel: hotelModel,
          buildingModel: buildingModel,
        ),
      ),
    );
  }
}
