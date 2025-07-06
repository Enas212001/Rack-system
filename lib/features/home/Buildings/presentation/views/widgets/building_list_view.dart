import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/widgets/custom_loading.dart';
import 'package:flutter_application_1/core/utils/widgets/lost_connection.dart';
import 'package:flutter_application_1/features/home/Buildings/cubit/building_cubit.dart';
import 'package:flutter_application_1/features/home/Hotels/models/hotel_model.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'building_item.dart';

class BuildingListView extends StatelessWidget {
  const BuildingListView({super.key, required this.hotelModel});
  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuildingCubit, BuildingState>(
      builder: (context, state) {
        if (state is BuildingLoading) {
          return SliverToBoxAdapter(child: CustomLoading());
        } else if (state is BuildingFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else if (state is BuildingSuccess) {
          final buildings = state.buildings;
          if (buildings.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Text(
                    'No buildings available',
                    style: CustomTextStyles.text14W500Primary,
                  ),
                ),
              ),
            );
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    AppRoutes.racks,
                    extra: GetRackArg(
                      hotel: hotelModel,
                      buildingModel: buildings[index],
                    ),
                  );
                },
                child: BuildingItem(building: buildings[index].buildingName!),
              ),
              childCount: buildings.length,
            ),
          );
        }
        return SliverToBoxAdapter(
          child: Center(
            child: LostConnection(
              onTap: () => context.read<BuildingCubit>().getBuildings(
                hotelId: hotelModel.id!,
              ),
            ),
          ),
        );
      },
    );
  }
}
