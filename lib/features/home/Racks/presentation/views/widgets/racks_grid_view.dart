import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/features/home/Buildings/models/building_model.dart';
import 'package:flutter_application_1/features/home/Hotels/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Racks/cubit/rack_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'rack_item.dart';

class RacksGridView extends StatelessWidget {
  const RacksGridView({
    super.key,
    required this.hotelModel,
    required this.buildingModel,
  });
  final HotelModel hotelModel;
  final BuildingModel buildingModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RackCubit, RackState>(
      builder: (context, state) {
        if (state is RacksLoading) {
          return SliverToBoxAdapter(
            child: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is RacksFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else if (state is RacksSuccess) {
          final racks = state.racks;
          if (racks.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(child: Text('No racks available')),
            );
          }
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => GestureDetector(
                onTap: () {
                  context.read<RackCubit>().getRacksInfo(
                    buildingRId: state.racks[index].buildingRId!,
                  );
                  GoRouter.of(context).push(
                    AppRoutes.rackInfo,
                    extra: GetRackArg(
                      hotel: hotelModel,
                      buildingModel: buildingModel,
                    ),
                  );
                },
                child: RackItem(id: racks[index].id!),
              ),
              childCount: racks.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
              mainAxisSpacing: 40.h,
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
