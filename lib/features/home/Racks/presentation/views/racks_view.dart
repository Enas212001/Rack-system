import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/my_app_drawer.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Hotels/data/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/rack_cubit/rack_cubit.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/switch_cubit/switch_cubit.dart';
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
      drawer: MyAppDrawer(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                RackCubit()..getRacksInfo(buildingId: buildingModel.id!),
          ),
          BlocProvider(
            create: (context) =>
                SwitchCubit()..getSwitchs(hotelId: buildingModel.hotelId!),
          ),
        ],
        child: RackViewBody(
          hotelModel: hotelModel,
          buildingModel: buildingModel,
        ),
      ),
    );
  }
}
