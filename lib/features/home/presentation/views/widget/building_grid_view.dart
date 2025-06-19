import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'building_item.dart';

class BuildingGridView extends StatelessWidget {
  const BuildingGridView({super.key, required this.hotelAsset});
  final String hotelAsset;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
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
                  BlocProvider.of<HomeCubit>(context).getRacksInfo();
                  GoRouter.of(context).push(AppRoutes.racks, extra: hotelAsset);
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
