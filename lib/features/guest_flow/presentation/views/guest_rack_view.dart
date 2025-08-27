import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/rack_cubit/rack_cubit.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/switch_cubit/switch_cubit.dart';
import 'package:flutter_application_1/features/home/devices/presentation/manager/cubit/device_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/guest_rack_view_body.dart';

class GuestRackView extends StatelessWidget {
  const GuestRackView({super.key, required this.building});
  final BuildingModel building;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RackCubit()..getRacksInfo(buildingId: building.id!),
          ),
          BlocProvider(
            create: (context) => SwitchCubit()..getSwitchs(hotelId: building.hotelId!),
          ),
          BlocProvider(
            create: (context) => DeviceCubit()..getDevices(switchId: building.id!),
          ),
        ],
        child: GuestRackViewBody(building: building),
      ),
    );
  }
}
