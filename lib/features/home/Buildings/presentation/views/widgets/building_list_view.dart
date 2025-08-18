import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_routes.dart';
import 'package:flutter_application_1/core/utils/widgets/custom_loading.dart';
import 'package:flutter_application_1/core/utils/widgets/lost_connection.dart';
import 'package:flutter_application_1/features/home/Buildings/presentation/cubit/building_cubit.dart';
import 'package:flutter_application_1/features/home/Hotels/data/models/hotel_model.dart';
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
          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor, width: 1.r),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.r,
                        vertical: 12.r,
                      ),
                      width: double.infinity,
                      color: AppColors.backgroundColor,
                      child: Text(
                        'Building Name',
                        style: CustomTextStyles.text14W500Primary,
                      ),
                    ),
                    Divider(height: 1, color: AppColors.borderColor),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: buildings.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              GoRouter.of(context).push(
                                AppRoutes.racks,
                                extra: GetRackArg(
                                  hotel: hotelModel,
                                  buildingModel: buildings[index],
                                ),
                              );
                            },
                            child: BuildingItem(building: buildings[index]),
                          ),
                          if (index < buildings.length - 1)
                            const Divider(
                              height: 1,
                              color: AppColors.borderColor,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
