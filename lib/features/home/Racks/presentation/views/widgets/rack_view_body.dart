import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/core/widget/top_with_back.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Hotels/data/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/rack_cubit/rack_cubit.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/switch_cubit/switch_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_tap_bar.dart';
import 'rack_switch_widget.dart';
import 'racks_list_view.dart';
import 'switch_list_view.dart';

class RackViewBody extends StatefulWidget {
  const RackViewBody({
    super.key,
    required this.hotelModel,
    required this.buildingModel,
  });

  final HotelModel hotelModel;
  final BuildingModel buildingModel;

  @override
  State<RackViewBody> createState() => _RackViewBodyState();
}

class _RackViewBodyState extends State<RackViewBody> {
  int selectedIndex = 0; // 0 = Racks, 1 = Switches

  @override
  Widget build(BuildContext context) {
    final rackCubit = context.read<RackCubit>();
    return RefreshIndicator(
      onRefresh: () async {
        switch (selectedIndex) {
          case 0:
            context.read<RackCubit>().getRacksInfo(
              buildingId: widget.buildingModel.id!,
            );
            break;
          case 1:
            context.read<SwitchCubit>().getSwitchs(
              hotelId: widget.buildingModel.hotelId!,
            );
            break;
        }
      },
      backgroundColor: AppColors.primaryColor,
      color: AppColors.whiteColor,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TopWithBack(
              text: selectedIndex == 0 ? AppStrings.racks : 'Switchs',
              title: selectedIndex == 0 ? 'Racks' : 'Switchs',
              onSearchChanged: (value) {
                if (selectedIndex == 0) {
                  context.read<RackCubit>().searchRack(value);
                } else {
                  context.read<SwitchCubit>().searchSwitch(value);
                }
              },
              withDrawer: false,
            ),
          ),
          SliverToBoxAdapter(
            child: RackSwitchWidget(
              selectedIndex: selectedIndex,
              onIndexChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              rackCubit: rackCubit,
              buildingModel: widget.buildingModel,
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(height: 1, color: AppColors.borderColor),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          SliverToBoxAdapter(
            child: AddTapBar(
              selectedIndex: selectedIndex,
              rackCubit: rackCubit,
              buildingModel: widget.buildingModel,
            ),
          ),
          selectedIndex == 0
              ? RacksListView(
                  hotelModel: widget.hotelModel,
                  buildingModel: widget.buildingModel,
                )
              : SwitchListView(buildingModel: widget.buildingModel),
        ],
      ),
    );
  }
}
