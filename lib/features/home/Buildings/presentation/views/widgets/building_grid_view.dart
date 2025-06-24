import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/features/home/Hotels/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Buildings/cubit/building_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'building_item.dart';

class BuildingGridView extends StatelessWidget {
  const BuildingGridView({super.key, required this.hotelModel});
  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuildingCubit, BuildingState>(
      builder: (context, state) {
        if (state is BuildingLoading) {
          return SliverToBoxAdapter(
            child: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is BuildingFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else if (state is BuildingSuccess) {
          final buildings = state.buildings;
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.racks, extra: hotelModel);
                },
                child: BuildingItem(building: buildings[index].id!),
              ),
              childCount: buildings.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
            ),
          );
        }
        return SliverToBoxAdapter(
          child: const Center(child: Text('No data available')),
        );
      },
    );
  }
}
