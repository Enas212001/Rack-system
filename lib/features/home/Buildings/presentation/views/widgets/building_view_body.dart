import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/features/home/Buildings/presentation/cubit/building_cubit.dart';
import 'package:flutter_application_1/features/home/Hotels/data/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/widget/top_with_back.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'building_info.dart';
import 'building_list_view.dart';

class BuildingViewBody extends StatelessWidget {
  const BuildingViewBody({super.key, required this.hotelModel});
  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    final buildingCubit = context.read<BuildingCubit>();
    return RefreshIndicator(
      onRefresh: () => buildingCubit.getBuildings(hotelId: hotelModel.id!),
      color: AppColors.primaryColor,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TopWithBack(
              onSearchChanged: buildingCubit.searchBuildings,
              title: 'Building',
              text:
                  hotelModel.name![0].toUpperCase() +
                  hotelModel.name!.substring(1),
            ),
          ),
          SliverToBoxAdapter(child: BuildingInfo(hotelModel: hotelModel)),
          BuildingListView(hotelModel: hotelModel),
        ],
      ),
    );
  }
}
