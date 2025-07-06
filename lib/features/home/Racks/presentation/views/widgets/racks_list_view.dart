import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/widgets/custom_loading.dart';
import 'package:flutter_application_1/core/utils/widgets/lost_connection.dart';
import 'package:flutter_application_1/features/home/Buildings/models/building_model.dart';
import 'package:flutter_application_1/features/home/Hotels/models/hotel_model.dart';
import 'package:flutter_application_1/features/home/Racks/cubit/rack_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'rack_item.dart';

class RacksListView extends StatelessWidget {
  const RacksListView({
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
          return SliverToBoxAdapter(child: const CustomLoading());
        } else if (state is RacksFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else if (state is RacksSuccess) {
          final racks = state.racks;
          if (racks.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Text(
                    'No racks available',
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
                  context.read<RackCubit>().getRacksInfo(
                    buildingRId: state.racks[index].buildingRId!,
                  );
                  GoRouter.of(context).push(
                    AppRoutes.rackInfo,
                    extra: GetRackArg(
                      hotel: hotelModel,
                      buildingModel: buildingModel,
                      rackInfoModel: racks[index],
                    ),
                  );
                },
                child: RackItem(
                  rackId: buildingModel.rackId!,
                  buildingRId: buildingModel.buildingRId!,
                ),
              ),
              childCount: racks.length,
            ),
          );
        }
        return SliverToBoxAdapter(
          child: Center(
            child: LostConnection(
              onTap: () => context.read<RackCubit>().getRacksInfo(
                buildingRId: buildingModel.buildingRId!,
              ),
            ),
          ),
        );
      },
    );
  }
}
