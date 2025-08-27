import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cache/cache_helper.dart';
import 'package:flutter_application_1/core/utils/api_key.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/service_locator.dart';
import 'package:flutter_application_1/core/utils/widget/top_with_back.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/rack_cubit/rack_cubit.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/switch_cubit/switch_cubit.dart';
import 'package:flutter_application_1/features/home/devices/presentation/manager/cubit/device_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'device_body.dart';
import 'guest_tap_bar.dart';
import 'rack_body.dart';
import 'switch_body.dart';

class GuestRackViewBody extends StatefulWidget {
  const GuestRackViewBody({super.key, required this.building});
  final BuildingModel building;
  @override
  State<GuestRackViewBody> createState() => _GuestRackViewBodyState();
}

class _GuestRackViewBodyState extends State<GuestRackViewBody> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        switch (selectedIndex) {
          case 0:
            context.read<RackCubit>().getRacksInfo(
              buildingId: widget.building.id!,
            );
            break;
          case 1:
            context.read<SwitchCubit>().getSwitchs(
              hotelId: widget.building.hotelId!,
            );
            break;
          case 2:
            context.read<DeviceCubit>().getDevices(
              switchId: widget.building.id!,
            );
            break;
        }
      },
      color: AppColors.primaryColor,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: TopWithBack(
              text:
                  'Welcome, ${getIt.get<CacheHelper>().getData(key: CacheKey.userName)}',
              noSearch: true,
              withDrawer: false,
            ),
          ),
          SliverToBoxAdapter(
            child: GuestRackTapBar(
              selectedIndex: selectedIndex,
              onIndexChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
          buildRacks(selectedIndex),
        ],
      ),
    );
  }

  Widget buildRacks(int index) {
    switch (index) {
      case 0:
        return BlocProvider(
          create: (context) =>
              RackCubit()..getRacksInfo(buildingId: widget.building.id!),
          child: RacksBody(),
        );
      case 1:
        return BlocProvider(
          create: (context) =>
              SwitchCubit()..getSwitchs(hotelId: widget.building.hotelId!),
          child: SwitchBody(
            onTap: () {
              setState(() {
                selectedIndex = 2;
              });
            },
          ),
        );
      case 2:
        return BlocProvider(
          create: (context) =>
              DeviceCubit()..getDevices(switchId: widget.building.id!),
          child: DeviceBody(),
        );
      default:
        return const SliverToBoxAdapter();
    }
  }
}
