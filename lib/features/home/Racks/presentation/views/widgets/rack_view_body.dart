import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/features/home/Buildings/data/models/building_model.dart';
import 'package:flutter_application_1/features/home/Hotels/data/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/cubit/rack_cubit.dart';
import 'package:flutter_application_1/features/home/widget/add_full_button.dart';
import 'package:flutter_application_1/features/home/widget/top_with_back.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'racks_list_view.dart';

class RackViewBody extends StatelessWidget {
  const RackViewBody({
    super.key,
    required this.hotelModel,
    required this.buildingModel,
  });
  final HotelModel hotelModel;
  final BuildingModel buildingModel;
  @override
  Widget build(BuildContext context) {
    final rackCubit = context.read<RackCubit>();
    return RefreshIndicator(
      onRefresh: () =>
          rackCubit.getRacksInfo(buildingRId: buildingModel.buildingRId!),
      color: AppColors.primaryColor,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TopWithBack(text: AppStrings.racks, isRack: true),
          ),
          RacksListView(hotelModel: hotelModel, buildingModel: buildingModel),
          SliverToBoxAdapter(
            child: AddFullSizeButton(
              text: AppStrings.addRack,
              onPressed: () {
                GoRouter.of(context).push(
                  AppRoutes.addRack,
                  extra: AddRackArgs(
                    rackCubit: rackCubit,
                    buildingModel: buildingModel,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
