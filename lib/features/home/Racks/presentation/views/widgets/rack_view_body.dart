import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/core/utils/widget/top_with_back.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Hotels/data/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/cubit/rack_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'rack_switch_widget.dart';
import 'racks_list_view.dart';

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
      onRefresh: () => rackCubit.getRacksInfo(
        buildingRId: widget.buildingModel.buildingRId!,
      ),
      color: AppColors.primaryColor,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TopWithBack(text: AppStrings.racks, isRack: true),
          ),
          // 🔹 Tabs (Racks / Switches)
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
          // 🔹 Content depending on tab
          _buildSelectedContent(),
        ],
      ),
    );
  }

  Widget _buildSelectedContent() {
    if (selectedIndex == 0) {
      return RacksListView(
        hotelModel: widget.hotelModel,
        buildingModel: widget.buildingModel,
      );
    } else {
      return SwitchListView(buildingModel: widget.buildingModel);
    }
  }
}

class SwitchListView extends StatelessWidget {
  const SwitchListView({super.key, required this.buildingModel});
  final BuildingModel buildingModel;

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter();
  }
}
